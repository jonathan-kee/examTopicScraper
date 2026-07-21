import {
  S3Client,
  CreateBucketCommand,
  DeleteBucketCommand,
  ListBucketsCommand,
  ListObjectsV2Command,
  PutObjectCommand,
  GetObjectCommand,
} from "@aws-sdk/client-s3";
import * as fs from "fs";
import { loadEnvFile } from 'node:process';

loadEnvFile('./.env');

const rustfs_client = new S3Client({
  region: process.env.BUCKET_REGION,
  endpoint: process.env.BUCKET_ENDPOINT, // RustFS S3 API address
  credentials: {
    accessKeyId: process.env.BUCKET_ACCESS_KEY_ID ?? "rustfsadmin",
    secretAccessKey: process.env.BUCKET_SECRET_ACCESS_KEY ?? "rustfsadmin",
  },
  // RustFS uses path-style URLs by default; virtual-host style requires RUSTFS_SERVER_DOMAINS
  forcePathStyle: true,
});


export async function createBucket(bucketName: string) {
  try {
    const response = await rustfs_client.send(
      new CreateBucketCommand({
        Bucket: bucketName,
      })
    );
    console.log("Bucket created:", response.Location);
  } catch (error) {
    console.log(error);
  }
}

export async function deleteBucket() {
  try {
    await rustfs_client.send(
      new DeleteBucketCommand({
        Bucket: "my-bucket",
      })
    );
    console.log("Bucket deleted");
  } catch (error) {
    console.log(error);
  }
}

export async function listBuckets() {
  try {
    const response = await rustfs_client.send(new ListBucketsCommand({}));
    response.Buckets?.forEach((bucket) => console.log(bucket.Name));
  } catch (error) {
    console.log(error);
  }
}

export async function listObjects() {
  try {
    const response = await rustfs_client.send(
      new ListObjectsV2Command({
        Bucket: "my-bucket",
      })
    );
    response.Contents?.forEach((obj) => console.log(`${obj.Key} (${obj.Size} bytes)`));
  } catch (error) {
    console.log(error);
  }
}

export async function uploadFile(bucketName:string, keyName:string, pathToObject:string) {
  try {
    await rustfs_client.send(
      new PutObjectCommand({
        Bucket: bucketName,
        Key: keyName, // Original argument "test/hello.txt"
        Body: fs.createReadStream(pathToObject), // Original argument "/path/to/hello.txt"
      })
    );
    console.log("Object uploaded");
  } catch (error) {
    console.log(error);
  }
}

export async function getObject() {
  try {
    const response = await rustfs_client.send(
      new GetObjectCommand({
        Bucket: "my-bucket",
        Key: "test/hello.txt",
      })
    );

    // get object content
    if (response.Body) {
      const chunks: Buffer[] = [];
      for await (const chunk of response.Body as any) {
        chunks.push(chunk as Buffer);
      }
      const data = Buffer.concat(chunks).toString("utf-8");
      console.log("Object content:", data);
    }
  } catch (error) {
    console.log(error);
  }
}