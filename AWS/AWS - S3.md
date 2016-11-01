(AWS) S3
=======

Amazon Simple Storage Service is storage for the Internet. It is designed to make web-scale computing easier for developers.

Amazon S3 has a simple web services interface that you can use to store and retrieve any amount of data, at any time, from anywhere on the web. It gives any developer access to the same highly scalable, reliable, fast, inexpensive data storage infrastructure that Amazon uses to run its own global network of web sites. The service aims to maximize benefits of scale and to pass those benefits on to developers.


###Before you begin###
 - Create an **IAM** user
 - Then download credentials that contains *Access Key* and *Secret Key*.
 - Then from **Dashboard > Users** click the **IAM** user you created then from **Summary** copy the **User ARN** we will use that later.


###Step 1: Create Bucket###

Go to **S3** then click **Create Bucket**

![Step 1](https://lh3.googleusercontent.com/tqrtR0Oa2I97NjExQsbQkbbQ26bWt4X6qx4icHJpdS6Zzys1aAgMIQk-Bnd1EXktGD1z261zsWs=w749-h377-no)


Provide **Bucket Name** called `bucketserver` and **Region** `US Standard` you can change the name and region what ever you want. Then click **Create**.

----



###Step 2: Modify Permissions###
-
 1. From the *Bucket List* select bucket that we created (`bucketserver`).
 2. Then from the upper right of the page select **Properties** then select **Permissions**.
 3. Then click **Add bucket policy** from there you we can generate bucket policy.
 4. From the lower left of the modal click **AWS Policy Generator** it will redirect you to generator page.

![Security Group Info](https://lh3.googleusercontent.com/RRDNazgOKsstdn9kBnGuOWyTjWqnQ-kl5u_krwdMMYEZR2Ow6HQKmQfR3rdZuthpR0XgDzIS3RU=w712-h675-no)

As you can see from the above screenshot we have 2 important step the **Select Policy Type** and **Add Statements**. Lets go to step 1 first.

> ###Select Policy Type####

From the **Select Type of Policy** dropdown list choose `S3 Bucket Policy`.

> ###Add Statement(s)####

 - Effect: `Allow`
 - Principal: the one you copy from IAM user's summary it looks like this `arn:aws:iam::000000000000:user/<iam_user_name>`
 - AWS Service: `Amazon S3`
 - Actions: You can select individual actions but for this example just thick `All Actions ('*')`
 - Amazon Resource Name (ARN): `arn:aws:s3:::<bucket_name>/<key_name>` or `arn:aws:s3:::<bucket_name>/*`
 - Click **generate** and copy the generated `JSON` then paste to **Bucket Policy**.
 
---
###DONE###
 You can now transfer files from your s3 or even connect it to your application just provide `access key` and `secret key` of **IAM** user.
