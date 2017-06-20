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
use app\index\Model\AdminNav as NavModel;

class Common extends Controller
{
    public function  _initialize(){
        header('Content-type"text/html;charset=utf-8');
        parent::_initialize();

        //是否登录状态
        $this->checkLogin();
        //分配菜单数据
        $tree = $this->getTreeData('level');
//        echo '<pre>';print_r($tree);exit();
        $this->assign('tree',$tree);
    }

    public function checkLogin(){
        if(!Session::get('userInfo')){
            $this->error('请登录','Login/index');
        }
    }


    /**
     * 获取全部菜单
     * @param string $type
     * @param string $order
     *
     * @return array
     */
    public function getTreeData($type = 'tree', $order = 'order_number'){
        $NavModel = new NavModel();
        if(empty($order)){
            $data = $NavModel->select();
        }else{
            $data = $NavModel->order('order_number','asc')->select();
        }
        $tree = $this->getTree($data);
        return $tree;
    }

    /**
     * 生成分类数组
     * @param array $data
     * @param int $pid
     * @return array
     */
    public function getTree($data){
        $tree = '';
        foreach($data as $k => $v){
            if($v['pid'] == '0'){
                foreach($data as $key => $val){
                    if($v['id'] == $val['pid']){
                        $tree[$k]['children'][$key]['name'] = $val['name'];
                        $tree[$k]['children'][$key]['pid'] = $val['pid'];
                        $tree[$k]['children'][$key]['mca'] = $val['mca'];
                        $tree[$k]['children'][$key]['id'] = $val['id'];
                        $tree[$k]['children'][$key]['ico'] = $val['ico'];
                        $tree[$k]['children'][$key]['order_number'] = $val['order_number'];
                    }
                }
                $tree[$k]['name'] = $v['name'];
                $tree[$k]['pid'] = $v['pid'];
                $tree[$k]['mca'] = $v['mca'];
                $tree[$k]['id'] = $v['id'];
                $tree[$k]['ico'] = $v['ico'];
                $tree[$k]['order_number'] = $v['order_number'];
            }
        }
        unset($data);
        return $tree;
    }
}