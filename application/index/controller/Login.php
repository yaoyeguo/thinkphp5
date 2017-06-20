<?php
namespace app\index\controller;

use think\Controller;
use think\Session;
use think\Request;
use app\index\model\Account;
use think\Log;

class Login extends Controller
{
    public function index()
    {
        //临时关闭当前模板的布局功能
        $this->view->engine->layout(false);
        return $this->fetch('index');
    }

    public function checkLogin(){
        $username = input('username');
        $passwd = input('passwd');

        if(!$username || !$passwd){
            return json(array('errorCode' => 1,'msg' => '参数有误'));
        }

        if(request()->isAjax() == false){
            return json(array('errorCode' => 1,'msg' => '请求类型异常'));
        }

        $accountInfo = Account::get([
            'name' => $username,
            'passwd' => md5($passwd),
        ]);

        if($accountInfo){
            Session::set('accountInfo', $accountInfo);
            return json(array('errorCode' => 0,'msg' => '登录成功'));
        } else {
            return json(array('errorCode' => 1,'msg' => '验证失败'));
        }
    }

    public function checkRegister(){

    }


}
