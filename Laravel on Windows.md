# Laravel on Windows

### Recipes (install the ff.)

  - [composer]
  - [node]
  - [xampp] (much better if php 5.6 or higher)
  - [git]

[composer]: <https://getcomposer.org/>
[node]: <https://nodejs.org/en/>
[xampp]: <https://www.apachefriends.org/index.html>
[git]: <https://git-scm.com/>

### Install laravel with composer
Open your terminal and type the written command below then hit enter.
```sh
C:\Users\Buttowski> composer global require "laravel/installer"
```

Now it's time to create a new laravel project. Go to your htdocs folder
and create laravel directory.
```sh
/** Go to htdocs folder */
C:\Users\Buttowski> cd C:\xampp\htdocs

/** Create laravel directory */
C:\xampp\htdocs> mkdir laravel
```

Inside laravel folder create a new project named `blog` using `laravel new` command.
```sh
C:\xampp\htdocs\laravel> laravel new blog
```
wait until all dependencies are installed and after that you have now laravel project named blog.


# One thing left
### With php artisan
If you have PHP installed locally and you would like to use PHP's built-in development server to serve your application, you may use the serve Artisan command. This command will start a development server at `http://localhost:8000`.
```sh
C:\xampp\htdocs\laravel> php artisan serve
```


### Using xampp
To host your project with xampp we need to modify `httpd-vhosts.conf` in apache and windows `hosts`. 

Add the ff. lines to `C:\xampp\apache\conf\extra\httpd-vhosts.conf` at the end of the file and save it.
```sh
<VirtualHost blog.dev:80>
    DocumentRoot "C:\xampp\htdocs\laravel\bloge\public"
    ServerAdmin blog.dev
    <Directory "C:\xampp\htdocs\laravel\blog">
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
```
Now our `apache` is now listening to blog.dev

Now lets modify the `C:\Windows\System32\drivers\etc\hosts` file add the ff. lines at the end of the fie and save it.
```sh
127.0.0.1    blog.dev
```

Done. you can access it with this url `http://simple.dev/`


![alt text](https://avatars3.githubusercontent.com/u/6651513?v=3&s=400 "Kirkmicz")


*Thats it.. Thanks!*
