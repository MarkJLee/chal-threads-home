import * as admin from "firebase-admin";
import * as functions from "firebase-functions";
import * as fs from "fs";
import * as path from "path";

admin.initializeApp();

exports.onPostImageUploaded = functions.firestore
    .document("posts_images/{imageId}")
    .onCreate(async (snapshot, context) => {
        const spawn = require("child-process-promise").spawn;
        const image = snapshot.data();

        // 파일의 확장자
        const ext = path.extname(image.fileUrl).toLowerCase();
        let outputPath = `/tmp/${snapshot.id}${ext}`;

        let quality = 80; // 초기 품질 설정

        do {
            // ImageMagick convert
            await spawn("convert", [image.fileUrl, "-quality", `${quality}%`, outputPath]);

            // 파일 크기를 확인
            const stats = fs.statSync(outputPath);
            const fileSizeInBytes = stats.size;
            const fileSizeInMegabytes = fileSizeInBytes / (1024 * 1024);

            if (fileSizeInMegabytes > 4) {
                quality -= 20; // 20% down
                if (quality < 10) {
                    throw new Error("Unable to compress image below 4MB without excessive quality loss.");
                }
            } else {
                break;
            }
        } while (true);

        const storage = admin.storage();

        // 원래의 저장 경로에 압축된 이미지를 업로드
        const originalPath = image.fileUrl.split("https://firebasestorage.googleapis.com/v0/b/")[1].split("?")[0];
        await storage.bucket().upload(outputPath, {
            destination: originalPath,
        });
    });
