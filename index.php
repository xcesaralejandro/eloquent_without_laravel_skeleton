<?php
    require 'start.php';
    use Controllers\UsersController; 
    $user = UsersController::Create(['canvas_sis_id' => 1, 'canvas_id' => 1, 'name' => 'test', 
                           'lastname' => 'test2', 'email' => 'test2']);