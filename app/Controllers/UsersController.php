<?php

namespace Controllers;
use Models\User; 

class UsersController{
    public static function Create($user){
        $user = User::create($user);
        return $user;
    }
}
