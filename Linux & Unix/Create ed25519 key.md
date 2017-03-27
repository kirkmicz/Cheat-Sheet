# Create ed25519 key (Ubuntu/Centos)

* Go to the ssh folder
	
	`$ cd ~/.ssh`

* Check content inside the folder it also shows the hidden files
	
	`$ ls -al`

* Generate Key
	
	`$ ssh-keygen -t ed25519 -b 4096 -C "<you email here>"`

* Check ssh-agent if running

  `$ eval "$(ssh-agent -s)"`

* Add create key

  `$ ssh-add ~/.ssh/id_ed25519`

* Open file
  
  `$ cat id_ed25519.pub`
