<?php
 
namespace Models;
use \Illuminate\Database\Eloquent\Model;
 
class User extends Model {
    protected $table = 'users';
    protected $fillable = ['id', 'canvas_sis_id', 'canvas_id', 'name', 'lastname', 
                           'email', 'created_at', 'updated_at', 'deleted_at'];
}
 
?>