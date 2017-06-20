<?php
/**
 * Created by PhpStorm.
 * User: luocan
 * Date: 2017/6/19
 * Time: 13:29
 */
namespace app\index\controller;

use think\Controller;
use think\Session;

class Common extends Controller
{
    public function  _initialize(){
        //是否登录状态
        $this->checkLogin();
    }

    public function checkLogin(){
        if(!Session::get('accountInfo')){
            $this->error('请登录','Login/index');
        }
    }
}