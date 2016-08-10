# Installing Scala on CentOS7

**Download Tarball file of Scala 2.11.6 or choose the latest version**

  `$ cd /data`
  
  `$ wget http://downloads.typesafe.com/scala/2.11.6/scala-2.11.6.tgz`

**Download RPM file of Scala 2.11.6 or choose the latest version**

  `$ cd /data`
  
  `wget http://downloads.typesafe.com/scala/2.11.6/scala-2.11.6.rpm`
  
**For Tarball install**

  ```
$ cp /data/scala-2.11.6.tgz /opt/
$ cd /opt/
$ tar -xvf scala-2.11.6.tgz
$ mv scala-2.11.6 scala
$ rm -f scala-2.11.6.tgz
  ```

**For RPM install**

  `$ rpm -ivh /data/scala-2.11.6.rpm`

**Configure scala, scalac, scaladoc and scalap commands using alternatives (in case you have done tarball installation)**
  ```
$ alternatives --install /usr/bin/scala scala /opt/scala/bin/scala 2 
$ alternatives --install /usr/bin/scalac scalac /opt/scala/bin/scalac 2 
$ alternatives --install /usr/bin/scaladoc scaladoc /opt/scala/bin/scaladoc 2 
$ alternatives --install /usr/bin/scalap scalap /opt/scala/bin/scalap 2
  ```
  
  *Note:* for Tarball only..

**Check Scala version**

  `$ scala -version`

For more info visit this site [click] (http://backtobazics.com/scala/4-steps-to-setup-scala-on-centos/)
