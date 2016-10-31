(AWS) Elastic Load Balancer
=======

An Application Load Balancer is a load balancing option for the Elastic Load Balancing service that operates at the application layer and allows you to define routing rules based on content across multiple services or containers running on one or more Amazon Elastic Compute Cloud (Amazon EC2) instances.


###Before you begin###
 - Create two EC2 instances named Server A and B.
 - If your instance running on Linux maybe you should have to install apache2, nginx or other web server.


###Step 1: Configure Load Balancer###
-
On the **EC2 dashboard** under **Load Balanacing** hit **Load Balancer**.

After that click **Create Load Balancer** then Go with **Application Load Balancer** then hit **Continue**.

> ####Basic Configuration####

![Basic Configuration](https://lh3.googleusercontent.com/SVVNOf1DuDiOCoX3q4jvBDEl7tqbEipmmro3kunMvIMW9uolaluD9WU8dzaRKbvYujP3WZvtkvA=w546-h98-no)

Provide the name of your `Load Balancer` this time named it `MyBalancer` or anything you want.


> ####Listeners####

![Listeners](https://lh3.googleusercontent.com/RhZ04g2C9k3REOuudKi2heiPAjDDSfX_f9IrXIEm7y086lXkerI5_BvCsmn9StZjx_wYZUScU-c=w903-h132-no)

We just leave default settings in the **Listeners** as we used to listen to port **80** but you can `Add listener` such as port **443**.


> ####Availability Zones####

![Availability Zones](https://lh3.googleusercontent.com/PjaCk2vLddmcCn5zB5LCk7A4XprkXt3ykNx83nd00LUJ30XYg3IFEN26DGmFcTvFE0wrdMFC-WI=w551-h266-no)

Actually you can add this all AZ's but for this example we only choose **us-east-1a** and **us-east-1b**.

After that we can now go for the next step. Hit **Next: Configure Security Settings** to continue.

----



###Step 2: Configure Security Settings###
-
A security group is a set of firewall rules that control the traffic to your load balancer. On this page, you can add rules to allow specific traffic to reach your load balancer. First, decide whether to create a new security group or select an existing one. For this we create new security group

> ####Security Group Info####

![Security Group Info](https://lh3.googleusercontent.com/vm1mEKcMoEcl0pYWIENzAVPHzDv9i069b14CKi5GnKWwVjO4ei6nKFqouw383x65CbWTgPPg-54=w701-h133-no)

Select **Create a new security group** and provide **Security group name** this time we named it `SecurityGroupEBL` leave **Description** default value.

> ####Set Rule####

![Set Rule](https://lh3.googleusercontent.com/enuhQtfZ8OsmpVUFs10JE12RV9XKI4O-W4FWv21Q53APUbNitMPqBQiQwDINzSmFmzAoZSBd=w740-h130-no)

Choose **HTTP** but if you set your **Listeners** to **HTTPS** you can edit or  click **Add Rule** and then add **HTTPS**.

----



###Step 3: Configure Routing###
-
Your load balancer routes requests to the targets in this target group using the protocol and port that you specify, and performs health checks on the targets using these health check settings. Note that each target group can be associated with only one load balancer.

> ####Target Group####

![Target Group](https://lh3.googleusercontent.com/5NiFGAToPyHpaUUtWcVQGKYCTjMx1fLhikDiN2wd5Aji1Ce5DqUxog_xhiZQ0QwJtVcayFgRtlQ=w565-h174-no)


The **main** name is our new Target Group. Because our **Listeners** listen to `HTTP` the protocol must be **HTTP** and the port should be **80**.

The rest of the settings from this configuration page leave it as the default value.

----



###Step 4: Register Targets###
-
Register targets with your target group. If you register an instance running in an enabled Availability Zone, the load balancer starts routing requests to the instance as soon as the registration process completes and the instance passes the initial health checks.

![Target Group](https://lh3.googleusercontent.com/D84WV9uhwJLqdrG6MTvPn43prq8oFMLPlu74HtnFPtgL-CuSBIeDvFiX07M7v3sbYczUFp-aDow=w531-h189-no)


Choose Server **A** and **B** and Add to registered then click **Next: Review**.

----



###Step 5: Review###
-
From this page you can review all of the settings from step 1 to the last. After that hit **Create** to create a new `Load Balancer`, `Security Group` and `Target Group`.


![Created Balancer](https://lh3.googleusercontent.com/NtWF8vyb_ntb2jusRe0dqrij5kHT1khtazKBB3Yw1A_itTVr99sVJKAOk4DcQyHaOHAOH-CDKMA=w611-h498-no)


As you can see from the above image the `Load Balancer` state is **provisioning** because its registering the Instances wait until the progress done and change the state to **active** then you now do check / test.

----



###Check It###
-
> ####Browser Check####

Maybe you might want to see or test if the **Load Balancer** is actually running. You can go to **EC2 dashboard** under **Load Balanacing** hit **Load Balancer** then click the `MyBalancer` the one we created and at the lower pane choose **Description** tab and go find **DNS name** something look like this `MyBalancer-1200498994.us-east-1.elb.amazonaws.com` copy it and paste to your browser see if it is running well.


> ####Health Check####

Maybe you might want to see the `Registered Instances` in the `Load Balancer`. You can go to **EC2 dashboard** under **Load Balanacing** hit **Target Groups** then click the `main` the one we created and at the lower pane choose **Monitoring** there you may see the different types of `metrics`.
