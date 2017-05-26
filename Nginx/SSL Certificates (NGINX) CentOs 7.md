SSL Certificates (NGINX) CentOs 7
=======

Make sure `selinux` is disabled

## Certbot

#### Install
Certbot is packaged in EPEL (Extra Packages for Enterprise Linux). To use Certbot, you must first enable the EPEL repository and enable EPEL optional channel.

If you are using ec2 you can enable optional channel by running:

```
$ yum -y install yum-utils
$ yum-config-manager --enable rhui-REGION-rhel-server-extras rhui-REGION-rhel-server-optional
```
After doing this, you can install Certbot by running:

`$ sudo yum install certbot`

#### Get Started
Certbot supports a number of different “plugins” that can be used to obtain and/or install certificates.

Since your server architecture doesn't yet support automatic installation you'll have to use the certonly command to obtain your certificate.

`$ certbot certonly`

#### Automating renewal
Certbot can be configured to renew your certificates automatically before they expire. Since Let's Encrypt certificates last for 90 days, it's highly advisable to take advantage of this feature. You can test automatic renewal for your certificates by running this command:

`certbot renew --dry-run`

If that appears to be working correctly, you can arrange for automatic renewal by adding a cron or systemd job which runs the following:

`certbot renew `

## Comodo

#### Purchase the cert

For purchasing the cert you will be asked for the content of `CSR` file when ordering the certificate. Here's the command to generate a `private_key` and `CSR` (Certificate Signing Request) file.

```
// generate private_key
openssl genrsa -out domain_name.key 2048

//generate CSR file.
openssl req -new -key domain_name.key -out domain_name.csr
```

After executed all those commands you might see 2 new files

```
// Private Key
domain_name.key

// CSR File
domain_name.csr
```

Now after you purchased and followed all the steps on their site you should get an email with you PositiveSSL Certificate. It contains a zip file with the ff:

```
STAR_domain_name.crt
STAR_domain_name.ca-bundle
```

Concatenate the `STAR_domain_name.crt` and the `STAR_domain_name.ca-bundle` file to generate bundle (`ssl-bundle.crt`).

```
// Command
cat STAR_domain_name.crt STAR_domain_name.ca-bundle > ssl-bundle.crt
```

in `Nginx` your ssl value should be like this

```
ssl_certificate_key /path/to/domain_name.key;
ssl_certificate /path/to/ssl-bundle.crt;

/**
ABOUT THE FILE LOCATION
domain_name.key = usually located at /etc/pki/tls/private/
ssl-bundle.crt = usually located at /etc/pki/tls/certs/
*/
```

#### Updating cert

Generate `CSR` file from existing private key

```
// generate CSR file.
openssl req -new -key domain_name.key -out domain_name.csr
```

The same steps in purchasing cert the difference is you just change the content of `ssl-bundle.crt` to the new one.
