<?php

/**
 * CakePHP(tm) : Rapid Development Framework (http://cakephp.org)
 * Copyright (c) Cake Software Foundation, Inc. (http://cakefoundation.org)
 *
 * Licensed under The MIT License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright Copyright (c) Cake Software Foundation, Inc. (http://cakefoundation.org)
 * @link      http://cakephp.org CakePHP(tm) Project
 * @since     0.2.9
 * @license   http://www.opensource.org/licenses/mit-license.php MIT License
 */

namespace App\Controller\Admin;

use App\Controller\AppController;
use Cake\Core\Configure;
use Cake\Network\Exception\NotFoundException;
use Cake\View\Exception\MissingTemplateException;
use Cake\ORM\TableRegistry;
use Cake\Datasource\ConnectionManager;
use Cake\Mailer\Email;
use Cake\Routing\Router;

//use Cake\I18n\FrozenDate; 
use Cake\Database\Type; 
//use Cake\I18n\Time;
//use Cake\I18n\Date;
//Type::build('date')->setLocaleFormat('yyyy-MM-dd');

// Admin Users Management
class ServicesController extends AppController {

    public function initialize() {
        parent::initialize();
        $this->Auth->allow(['index','forgot']);
     }   
    
    public $uses = array('User', 'Admin');
    
   
    
    //service type management start
    
    public function listservicetype() {
        $this->viewBuilder()->layout('admin');
        $this->loadModel('ServiceTypes');
        
       // $conditions = ['ServiceTypes.status'=> 1];
           
        $this->paginate = [
            
            'order' => [ 'id' => 'DESC']
        ];
        $service = $this->paginate($this->ServiceTypes);
        //pr($user->toArray());
        $this->set(compact('service'));
        $this->set('_serialize', ['service']);
 
    }
    
    
   
    public function addservicetype() {
        $this->viewBuilder()->layout('admin');
        $this->loadModel('ServiceTypes');
        $this->loadModel('Tags');
        
        $service = $this->ServiceTypes->newEntity();
        if ($this->request->is('post')) {

            $flag = true;
            
            $tableRegObj = TableRegistry::get('ServiceTypes');
           
            // Validating Form
            if($this->request->data['type_name'] == ""){
                $this->Flash->error(__('Service type Name can not be null. Please, try again.')); $flag = false;
            }
            
             $arr_ext = array('jpg', 'jpeg', 'gif', 'png');
            if (!empty($this->request->data['icon']['name'])) {
                $file = $this->request->data['icon']; //put the data into a var for easy use
                $ext = substr(strtolower(strrchr($file['name'], '.')), 1); //get the extension
                $fileName = time() . "." . $ext;
                if (in_array($ext, $arr_ext)) {
                    
                    if ($service->icon != "" && $service->icon != $fileName ) {
                        $filePathDel = WWW_ROOT . 'service_img' . DS . $service->icon;
                        if (file_exists($filePathDel)) {
                            unlink($filePathDel);
                        }
                    }                     
                    move_uploaded_file($file['tmp_name'], WWW_ROOT . 'service_img' . DS . $fileName);
                    $file = $fileName;
                    $this->request->data['icon'] = $fileName;
                } else {
                    $flag = false;
                    $this->Flash->error(__('Upload image only jpg,jpeg,png files.'));
                }
            } else {
                $this->request->data['icon'] = $user->icon;
            }
                    
            if($flag){
                   $this->request->data['tag_id']=implode(',',$this->request->data['tag_id']);        
                // Saving User details after validation
                $service = $this->ServiceTypes->patchEntity($service, $this->request->data);
                if ($s=$this->ServiceTypes->save($service)) {
                    
                    $this->Flash->success('Service type added successfully.', ['key' => 'success']);
                    
                    //pr($this->request->data); pr($user); exit;
                    $this->redirect(['action' => 'listservicetype']);
                }
            }
        }
        
        
       
        $tags = $this->Tags->find()->where(['Tags.status' => 1])->toArray();
        
        $this->set(compact('service','tags'));
        $this->set('_serialize', ['service','tags']);
    }
    
    
    
     public function editservicetype($id = null) {
        $this->viewBuilder()->layout('admin');
        $this->loadModel('ServiceTypes');
        $this->loadModel('Tags');
        
        $user = $this->ServiceTypes->get($id);
        if ($this->request->is(['post', 'put'])) {
            //pr($this->request->data); exit;
            $flag = true;
            if($this->request->data['type_name'] == ""){
                $this->Flash->error(__('service type Name can not be null. Please, try again.')); $flag = false;
            }
             $arr_ext = array('jpg', 'jpeg', 'gif', 'png');
            if (!empty($this->request->data['icon']['name'])) {
                $file = $this->request->data['icon']; //put the data into a var for easy use
                $ext = substr(strtolower(strrchr($file['name'], '.')), 1); //get the extension
                $fileName = time() . "." . $ext;
                if (in_array($ext, $arr_ext)) {
                    
                    if ($user->icon != "" && $user->icon != $fileName ) {
                        $filePathDel = WWW_ROOT . 'service_img' . DS . $user->icon;
                        if (file_exists($filePathDel)) {
                            unlink($filePathDel);
                        }
                    }                     
                    move_uploaded_file($file['tmp_name'], WWW_ROOT . 'service_img' . DS . $fileName);
                    $file = $fileName;
                    $this->request->data['icon'] = $fileName;
                } else {
                    $flag = false;
                    $this->Flash->error(__('Upload image only jpg,jpeg,png files.'));
                }
            } else {
                $this->request->data['icon'] = $user->icon;
            }
            if($flag){
               //$this->request->data['tag_id']=implode(',',$this->request->data['tag_id']);
                $user = $this->ServiceTypes->patchEntity($user, $this->request->data);
                
                if ($this->ServiceTypes->save($user)) {
                    $this->Flash->success(__('Service type has been edited successfully.'));
                    return $this->redirect(['action' => 'listservicetype']);
                } else {
                    $this->Flash->error(__('Service could not be edit. Please, try again.'));
                    //return $this->redirect(['action' => 'listservice',$id]);
                }
            } else {
                return $this->redirect(['action' => 'listservicetype']);
            }           
        }
        
         $tags = $this->Tags->find()->where(['Tags.status' => 1])->toArray();
         
        $this->set(compact('user','tags','selecttags'));
        $this->set('_serialize', ['user','tags','selecttags']);
    }
    
   
    
    
    
    public function servicetypedelete($id = null) {
        $this->loadModel('ServiceTypes');
        $services = $this->ServiceTypes->get($id);
        if ($this->ServiceTypes->delete($services)) {
            $this->Flash->success(__('Service Type has been deleted.'));
        } else {
            $this->Flash->error(__('Service Type could not be deleted. Please, try again.'));
        }
        return $this->redirect(['action' => 'listservicetype']);
    }
    
    public function servicetypestatus($id = null, $status = null) {
       
        $this->loadModel('ServiceTypes'); 
        $tableRegObj = TableRegistry::get('ServiceTypes');
        $query = $tableRegObj->find('all', [ 'conditions' => ['id' => $id]]);
        $row = $query->first()->toArray();
        //pr($row); exit;
        if($row){
            $subquestion = TableRegistry::get('ServiceTypes');
            $query = $subquestion->query();
            if($status == 1){
                $query->update()->set(['status' => 1,])->where(['id' => $id])->execute();
                $this->Flash->success(__('Service Types has been activated.'));
            } else if($status == 0){
                $query->update()->set(['status' => 0])->where(['id' => $id])->execute(); 
                $this->Flash->success(__('Service Types has been suspended.'));
            }
        } else {
            $this->Flash->error(__('Service Types Not Found.'));
        }        
        return $this->redirect(['action' => 'listservicetype']); 
    }
    //service type management end
    
    
    
    //For tag Management start
    
     public function listmake() {
        $this->viewBuilder()->layout('admin');
        $this->loadModel('Makes');
        $this->loadModel('Makes');
        //$conditions = ['ServiceTypes.status'=> 1];
           
        $this->paginate = [
            
            'order' => [ 'id' => 'DESC']
        ];
        $service = $this->paginate($this->Makes);
        //pr($user->toArray());
        
        
        //pr($result);
        $this->set(compact('service'));
        $this->set('_serialize', ['service']);
 
    }
    
    
   
    public function addmake() {
        $this->viewBuilder()->layout('admin');
        $this->loadModel('Makes');
        $service = $this->Makes->newEntity();
        if ($this->request->is('post')) {

            $flag = true;
            
            $tableRegObj = TableRegistry::get('Makes');
           
            // Validating Form
            if($this->request->data['make_name'] == ""){
                $this->Flash->error(__('Maker Name can not be null. Please, try again.')); $flag = false;
            }
                        
            if($flag){
                           
                // Saving User details after validation
                $service = $this->Makes->patchEntity($service, $this->request->data);
                if ($this->Makes->save($service)) {
                 
                    $this->Flash->success('Maker added successfully.', ['key' => 'success']);
                    
                    //pr($this->request->data); pr($user); exit;
                    $this->redirect(['action' => 'listmake']);
                }
            }
        }
        $this->set(compact('service'));
        $this->set('_serialize', ['service']);
    }
    
    
    
     public function editmake($id = null) {
        $this->viewBuilder()->layout('admin');
        $this->loadModel('Makes');
        $user = $this->Makes->get($id);
        if ($this->request->is(['post', 'put'])) {
            //pr($this->request->data); exit;
            $flag = true;
            if($this->request->data['make_name'] == ""){
                $this->Flash->error(__('Maker Name can not be null. Please, try again.')); $flag = false;
            }           
            if($flag){
               
                $user = $this->Makes->patchEntity($user, $this->request->data);
                
                if ($this->Makes->save($user)) {
                    $this->Flash->success(__('Maker has been edited successfully.'));
                    return $this->redirect(['action' => 'listmake']);
                } else {
                    $this->Flash->error(__('Maker could not be edit. Please, try again.'));
                    //return $this->redirect(['action' => 'listservice',$id]);
                }
            } else {
                return $this->redirect(['action' => 'listmake']);
            }           
        }
        
        $this->set(compact('user'));
        $this->set('_serialize', ['user']);
    }
    
   
    
    
    
    public function makedelete($id = null) {
        $this->loadModel('Makes');
        $services = $this->Makes->get($id);
        if ($this->Makes->delete($services)) {
            $this->Flash->success(__('Maker has been deleted.'));
        } else {
            $this->Flash->error(__('Maker could not be deleted. Please, try again.'));
        }
        return $this->redirect(['action' => 'listmake']);
    }
    
    public function makestatus($id = null, $status = null) {
       
        $this->loadModel('Makes'); 
        $tableRegObj = TableRegistry::get('Makes');
        $query = $tableRegObj->find('all', [ 'conditions' => ['id' => $id]]);
        $row = $query->first()->toArray();
        //pr($row); exit;
        if($row){
            $subquestion = TableRegistry::get('Makes');
            $query = $subquestion->query();
            if($status == 1){
                $query->update()->set(['status' => 1,])->where(['id' => $id])->execute();
                $this->Flash->success(__('Maker has been activated.'));
            } else if($status == 0){
                $query->update()->set(['status' => 0])->where(['id' => $id])->execute(); 
                $this->Flash->success(__('Maker has been suspended.'));
            }
        } else {
            $this->Flash->error(__('Maker Not Found.'));
        }        
        return $this->redirect(['action' => 'listmake']); 
    }
    
    //tag management end
    
    
    //Interest management start
    
     public function listmodel() {
        $this->viewBuilder()->layout('admin');
        $this->loadModel('Models');
        
       // $conditions = ['ServiceTypes.status'=> 1];
           
        $this->paginate = [
            
            'order' => [ 'Makes.make_name']
        ];
        $service = $this->paginate($this->Models,['contain' => ['Makes']]);
       // pr($service);
        $this->set(compact('service'));
        $this->set('_serialize', ['service']);
 
    }
    
    
   
    public function addmodel() {
        $this->viewBuilder()->layout('admin');
        $this->loadModel('Models');
        $this->loadModel('Makes');
        $service = $this->Models->newEntity();
        if ($this->request->is('post')) {

            $flag = true;
            
            $tableRegObj = TableRegistry::get('Models');
           
            // Validating Form
            if($this->request->data['model_name'] == ""){
                $this->Flash->error(__('Model Name can not be null. Please, try again.')); $flag = false;
            }
                        
            if($flag){
                  //$this->request->data['model_name']=$this->request->data['model_name'];         
                // Saving User details after validation
                $service = $this->Models->patchEntity($service, $this->request->data);
                if ($this->Models->save($service)) {
                 
                    $this->Flash->success('Model added successfully.', ['key' => 'success']);
                    
                    //pr($this->request->data); pr($user); exit;
                    $this->redirect(['action' => 'listmodel']);
                }
            }
        }
        $makes= $this->Makes->find()->where(['status'=>1])->toArray();
        $this->set(compact('service','makes'));
        $this->set('_serialize', ['service']);
    }
    
    
    
     public function editmodel($id = null) {
        $this->viewBuilder()->layout('admin');
        $this->loadModel('Models');
        $this->loadModel('Makes');
        $user = $this->Models->get($id);
        if ($this->request->is(['post', 'put'])) {
            //pr($this->request->data); exit;
            $flag = true;
            if($this->request->data['model_name'] == ""){
                $this->Flash->error(__('Model Name can not be null. Please, try again.')); $flag = false;
            }           
            if($flag){
               
                $user = $this->Models->patchEntity($user, $this->request->data);
                
                if ($this->Models->save($user)) {
                    $this->Flash->success(__('Model has been edited successfully.'));
                    return $this->redirect(['action' => 'listmodel']);
                } else {
                    $this->Flash->error(__('Model could not be edit. Please, try again.'));
                    //return $this->redirect(['action' => 'listservice',$id]);
                }
            } else {
                return $this->redirect(['action' => 'listmodel']);
            }           
        }
        $makes= $this->Makes->find()->where(['status'=>1])->toArray();
        $this->set(compact('user','makes'));
        $this->set('_serialize', ['user']);
    }
    
   
    
    
    
    public function modeldelete($id = null) {
        $this->loadModel('Models');
        $services = $this->Models->get($id);
        if ($this->Models->delete($services)) {
            $this->Flash->success(__('Model has been deleted.'));
        } else {
            $this->Flash->error(__('Model could not be deleted. Please, try again.'));
        }
        return $this->redirect(['action' => 'listmodel']);
    }
    
    public function modelstatus($id = null, $status = null) {
       
        $this->loadModel('Models'); 
        $tableRegObj = TableRegistry::get('Models');
        $query = $tableRegObj->find('all', [ 'conditions' => ['id' => $id]]);
        $row = $query->first()->toArray();
        //pr($row); exit;
        if($row){
            $subquestion = TableRegistry::get('Models');
            $query = $subquestion->query();
            if($status == 1){
                $query->update()->set(['status' => 1,])->where(['id' => $id])->execute();
                $this->Flash->success(__('Model has been activated.'));
            } else if($status == 0){
                $query->update()->set(['status' => 0])->where(['id' => $id])->execute(); 
                $this->Flash->success(__('Model has been suspended.'));
            }
        } else {
            $this->Flash->error(__('Model Not Found.'));
        }        
        return $this->redirect(['action' => 'listmodel']); 
    }
    
    //interest management end
    
    //For feature Management start
    
     public function listfeature() {
        $this->viewBuilder()->layout('admin');
        $this->loadModel('Features');
        
       // $conditions = ['ServiceTypes.status'=> 1];
           
        $this->paginate = [
            
            'order' => [ 'id' => 'DESC']
        ];
        $service = $this->paginate($this->Features);
        //pr($user->toArray());
        $this->set(compact('service'));
        $this->set('_serialize', ['service']);
 
    }
    
    
   
    public function addfeature() {
        $this->viewBuilder()->layout('admin');
        $this->loadModel('Features');
        $this->loadModel('ServiceTypes'); 
        $service = $this->Features->newEntity();
        if ($this->request->is('post')) {

            $flag = true;
            
            $tableRegObj = TableRegistry::get('Features');
           
            // Validating Form
            if($this->request->data['feature_name'] == ""){
                $this->Flash->error(__('Tag Name can not be null. Please, try again.')); $flag = false;
            }
                        
            if($flag){
                 $servicetype = implode(',',$this->request->data['service_type_id']);
                 $this->request->data['service_type_id']=$servicetype;
                // Saving User details after validation
                $service = $this->Features->patchEntity($service, $this->request->data);
                if ($this->Features->save($service)) {
                 
                    $this->Flash->success('Feature added successfully.', ['key' => 'success']);
                    
                    //pr($this->request->data); pr($user); exit;
                    $this->redirect(['action' => 'listfeature']);
                }
            }
        }
        $servicetypes = $this->ServiceTypes->find()->where(['ServiceTypes.status' => 1])->toArray();
        $this->set(compact('service','servicetypes'));
        $this->set('_serialize', ['service']);
    }
    
    
    
     public function editfeature($id = null) {
        $this->viewBuilder()->layout('admin');
        $this->loadModel('Features');
        $this->loadModel('ServiceTypes');
        $user = $this->Features->get($id);
        if ($this->request->is(['post', 'put'])) {
            //pr($this->request->data); exit;
            $flag = true;
            if($this->request->data['feature_name'] == ""){
                $this->Flash->error(__('Feature Name can not be null. Please, try again.')); $flag = false;
            }           
            if($flag){
               $servicetype = implode(',',$this->request->data['service_type_id']);
               $this->request->data['service_type_id']=$servicetype;
                $user = $this->Features->patchEntity($user, $this->request->data);
                
                if ($this->Features->save($user)) {
                    $this->Flash->success(__('Feature has been edited successfully.'));
                    return $this->redirect(['action' => 'listfeature']);
                } else {
                    $this->Flash->error(__('Feature could not be edit. Please, try again.'));
                    //return $this->redirect(['action' => 'listservice',$id]);
                }
            } else {
                return $this->redirect(['action' => 'listfeature']);
            }           
        }
        $servicetypes = $this->ServiceTypes->find()->where(['ServiceTypes.status' => 1])->toArray();
        $this->set(compact('user','servicetypes'));
        $this->set('_serialize', ['user']);
    }
    
   
    
    
    
    public function featuredelete($id = null) {
        $this->loadModel('Features');
        $services = $this->Features->get($id);
        if ($this->Features->delete($services)) {
            $this->Flash->success(__('Feature has been deleted.'));
        } else {
            $this->Flash->error(__('Feature could not be deleted. Please, try again.'));
        }
        return $this->redirect(['action' => 'listfeature']);
    }
    
    public function featurestatus($id = null, $status = null) {
       
        $this->loadModel('Features'); 
        $tableRegObj = TableRegistry::get('Features');
        $query = $tableRegObj->find('all', [ 'conditions' => ['id' => $id]]);
        $row = $query->first()->toArray();
        //pr($row); exit;
        if($row){
            $subquestion = TableRegistry::get('Features');
            $query = $subquestion->query();
            if($status == 1){
                $query->update()->set(['status' => 1,])->where(['id' => $id])->execute();
                $this->Flash->success(__('Feature has been activated.'));
            } else if($status == 0){
                $query->update()->set(['status' => 0])->where(['id' => $id])->execute(); 
                $this->Flash->success(__('Feature has been suspended.'));
            }
        } else {
            $this->Flash->error(__('Tag Not Found.'));
        }        
        return $this->redirect(['action' => 'listfeature']); 
    }
    
    //feature management end
    
    
     public function listemailsubscriber() {
        $this->viewBuilder()->layout('admin');
        $this->loadModel('EmailSubscribers');
        
       // $conditions = ['ServiceTypes.status'=> 1];
           
        $this->paginate = [
            
            'order' => [ 'id' => 'DESC']
        ];
        $service = $this->paginate($this->EmailSubscribers);
        //pr($user->toArray());
        $this->set(compact('service'));
        $this->set('_serialize', ['service']);
 
    }
    
    public function subscriberdelete($id = null) {
        $this->loadModel('EmailSubscribers');
        $services = $this->EmailSubscribers->get($id);
        if ($this->EmailSubscribers->delete($services)) {
            $this->Flash->success(__('Subscribers has been deleted.'));
        } else {
            $this->Flash->error(__('Subscribers could not be deleted. Please, try again.'));
        }
        return $this->redirect(['action' => 'listemailsubscriber']);
    }
    
    public function subscriberstatus($id = null, $status = null) {
       
        $this->loadModel('EmailSubscribers'); 
        $tableRegObj = TableRegistry::get('EmailSubscribers');
        $query = $tableRegObj->find('all', [ 'conditions' => ['id' => $id]]);
        $row = $query->first()->toArray();
        //pr($row); exit;
        if($row){
            $subquestion = TableRegistry::get('EmailSubscribers');
            $query = $subquestion->query();
            if($status == 1){
                $query->update()->set(['status' => 1,])->where(['id' => $id])->execute();
                $this->Flash->success(__('Subscribers has been activated.'));
            } else if($status == 0){
                $query->update()->set(['status' => 0])->where(['id' => $id])->execute(); 
                $this->Flash->success(__('Subscribers has been suspended.'));
            }
        } else {
            $this->Flash->error(__('Subscribers Not Found.'));
        }        
        return $this->redirect(['action' => 'listemailsubscriber']); 
    }
    
    public function sendemail() {
        $this->viewBuilder()->layout('admin');
        $this->loadModel('EmailSubscribers');
        
        
        $allmailid= $this->EmailSubscribers->find()->where(['status'=>1])->toArray();
        
        if ($this->request->is('post')) {

            if($this->request->data['subscriber_number']== 1){
                
               foreach($allmailid as $dt){
                $mail_To = $dt['email_id'];
                $mail_CC = '';
                $mail_subject = 'Carvis Notification';
                //$name = $userExist['first_name'] . " " . $userExist['last_name'];
                $url = Router::url('/', true);
                
                $mail_body = $this->request->data['mail_text'];
               
                $email = new Email('default');
                if ($email->emailFormat('html')->from(['nit.spandan@gmail.com' => 'Carvis'])
                                ->to($mail_To)
                                ->subject($mail_subject)
                                ->send($mail_body)) {
                    $this->Flash->success(__('Email sent successfully'));
                    //return $this->redirect(array('action' => 'index'));
                }else{
                    
                 $this->Flash->error(__('Email not sent successfully'));   
                }
                
               }   
              
            }
            
        }
        
    }
    
    
    
    
}
