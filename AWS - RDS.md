(AWS) RDS 
=======

Amazon Relational Database Service (Amazon RDS) is a web service that makes it easier to set up, operate, and scale a relational database in the cloud. It provides cost-efficient, resizeable capacity for an industry-standard relational database and manages common database administration tasks.


###Before you begin###

#####Create New Group#####
--
 - Login to your root account then go to **IAM** page
 - Under dashboard left pane click **Groups** then hit **Create New Group** and Enter the name of your Group then click **Next Page**
 - From the **Attach Policy** page look for `AdministratorAccess` select then click **Next Page** > **Create Group**

#####Create New User#####
--
 - Login to your root account then go to **IAM** page
 - Under dashboard left pane click **Users** then hit **Create New Users** from the 1st box enter the name of the user then click **Create**. Make sure that the **Generate an access key for each user** is off or unthick.
 - From the list of users click the name of user you created. Then at the lower pane click **Security Credentials** tab under that go to **Sign-In Credentials** then click   **Manage Password**
 - From the **Manage Password** page choose **Assign a custom password** then provide your password after that click **Apply**.
 - After that go to **Groups** tab then click **Add User to Groups**  then select the group you created then click **Add to Groups**
 - Go back to **IAM** Dashboard then copy **IAM users sign-in link** there you can login your **IAM** account.


###Step 1: Select Engine###
-
From **RDS** Dashboard > **Instances** and click **Launch DB Instance**

![Select Engine](https://lh3.googleusercontent.com/qP_PG9YgoSSmix7rPt1xZ28uKDA00hYaunyaRrwziiweVv--dFE9WLBhqmZMngPNozjkXCBGXv72=w865-h496-no)

Now select DB you preferred but for now maybe we can use PostgreSQL as our DB.

---
###Step 2: Select Plan###
--

![Select Plan](https://lh3.googleusercontent.com/ca-Ac5nFYVZF-Mhd3DKOk8X8OckbnUClACIKBeQQf9AGbg8pj5I4N6VxpnmKUsEJ3eExfS9d5zg7=w678-h418-no)

For now just choose **Dev/Test** later on you can move to **Production**.

---

###Step 3: Specify DB Details###
--

*Note:* All provided details (**Instance Specification**) shown from the image below is under the **Free Tier**.

![Specify DB Details](https://lh3.googleusercontent.com/u19tXran7FAoKWKOA7-nxmfehfTPxw5D1Q7u55MdrGRy5vx_sGMLtG4YR7Yv7ChJz4V5baWDMDSN=w568-h734-no)

In the **Settings** Section see the details provided.

key  | value
------------- | ------------- 
*DB Instance Identifier*    | mydbinstance
*Master Username*    | awsuser 
*Master Password*    | mypassword

---

###Step 4: Configure Advanced Settings###
--

Make sure you have created **Security Group** with accepts all traffic then select that as your **VPC Security Groups** take a look the image below.

![Specify DB Details](https://lh3.googleusercontent.com/LYQAytn7kjtAl3rE-7HWyXE4OxjdX1tTr_mOlGMcfWimJ9Cl9qJBICslLvYpgEKtT5CXAY2KnnPi=w539-h731-no)

In the **Database Options** Section see the **Database Name** we provided. The rest leave the value as default.

---
###Done###
