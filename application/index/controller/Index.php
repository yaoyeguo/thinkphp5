<?php
namespace app\index\controller;

use app\index\model\AdminNav as navModel;

class Index extends Common
{
    public function index()
    {
        return $this->fetch('index');
    }


    public function add()
    {
        return $this->fetch('add');
    }

    public function update(){
        $menu = navModel::where('id',input('id'))->find();
        $this->assign('menu',$menu);
        return $this->fetch('update');
    }

    public function deleteMenu(){
        $id = input('id');
        if(!$id){
            return json(array('errorCode' => 1,'msg' => '参数有误'));
        }

        if(navModel::where('id',$id)->delete()){
            return json(array('errorCode' => 0,'msg' => '删除成功'));
        }
        return json(array('errorCode' => 1,'msg' => '删除异常'));
    }

    public function saveMenu(){
        if(!input('name')){
            return json(array('errorCode' => 1,'msg' => '参数有误'));
        }

        $name = input('name');
        $mca = input('mca') ? input('mca') : '#';
        $order = input('order') ? input('order') : '50';

        $data = array(
            'name' => $name,
            'mca' => $mca,
            'order_number' => $order,
        );
        $navModel = new NavModel();
        if(input('id')){
            $navModel::where('id',input('id'))->update($data);
            return json(array('errorCode' => 0,'msg' => '更新成功'));
        }else{
            $navModel->save($data);
            return json(array('errorCode' => 0,'msg' => '添加成功'));
        }
        return json(array('errorCode' => 1,'msg' => '更新异常'));
    }
    

}
