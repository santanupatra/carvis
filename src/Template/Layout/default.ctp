<?php
/**
 * CakePHP(tm) : Rapid Development Framework (http://cakephp.org)
 * Copyright (c) Cake Software Foundation, Inc. (http://cakefoundation.org)
 *
 * Licensed under The MIT License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright (c) Cake Software Foundation, Inc. (http://cakefoundation.org)
 * @link          http://cakephp.org CakePHP(tm) Project
 * @since         0.10.0
 * @license       http://www.opensource.org/licenses/mit-license.php MIT License
 */
$cakeDescription = 'CakePHP: the rapid development php framework';
?>


<!DOCTYPE HTML>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <?php $filePathf = WWW_ROOT . 'logo' . DS . $SiteSettings['site_favicon']; ?>
        <?php if ($SiteSettings['site_favicon'] != "" && file_exists($filePathf)) { ?>
            <?php echo $this->Html->meta('favicon.ico', 'logo/' . $SiteSettings['site_favicon'], array('type' => 'icon')); ?>
        <?php } else { ?>
            <?php echo $this->Html->meta('favicon.ico', 'img/unnamed.png', array('type' => 'icon')); ?>
        <?php } ?>         
        

        <?php if(empty($pageSeo)){ ?>
            <title> <?php echo $SiteSettings['site_meta_title'] ?> </title>
            <meta name="description" content="<?php echo $SiteSettings['site_meta_description'] ?>" />   
            <meta name="keywords" content="<?php echo $SiteSettings['site_meta_key'] ?>" />            
        <?php } else if(!empty($pageSeo)){ ?>
            <title> <?php echo $pageSeo['site_meta_title'] != "" ? $pageSeo['site_meta_title'] : 'Ascot Pharmacy' ?> </title>
            <meta name="description" content="<?php echo $pageSeo['site_meta_description'] ?>" />   
            <meta name="keywords" content="<?php echo $pageSeo['site_meta_key'] ?>" />        
        <?php } else { ?>
            <title> Ascot Pharmacy </title>
            <meta name="description" content="" />   
            <meta name="keywords" content="" />             
        <?php } ?>
        

        
        
        
        
        <?php echo $this->Html->css('bootstrap.css') ?>
        <?php echo $this->Html->css('bootstrap-theme.css') ?>
        <?php echo $this->Html->css('/font-awesome/css/font-awesome.css') ?>
        <?php echo $this->Html->css('jquery.bxslider.css') ?>
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900" rel="stylesheet">

        <!--  ################################## CSS Added By Developer Start Here  ############################################  -->    
        <?php echo $this->Html->css('/plugins/validationengine/css/validationEngine.jquery.css') ?>
        <?php echo $this->Html->css('/plugins/dataTables/dataTables.bootstrap.css') ?>
        <!-- (-3) link from Admin Panel -->

        <!-- (-2) link from Admin Panel -->
        <?php echo $this->Html->css('admin/jquery-ui.css') ?> 

        
        <?php echo $this->Html->css('/plugins/uniform/themes/default/css/uniform.default.css') ?>
        <?php echo $this->Html->css('/plugins/inputlimiter/jquery.inputlimiter.1.0.css') ?>
        <?php echo $this->Html->css('/plugins/chosen/chosen.min.css') ?>

        <?php echo $this->Html->css('/plugins/colorpicker/css/colorpicker.css') ?>
        <?php echo $this->Html->css('/plugins/tagsinput/jquery.tagsinput.css') ?>
        <?php echo $this->Html->css('/plugins/daterangepicker/daterangepicker-bs3.css') ?>    

        <?php echo $this->Html->css('/plugins/datepicker/css/datepicker.css') ?>
        <?php echo $this->Html->css('/plugins/timepicker/css/bootstrap-timepicker.min.css') ?>
        <?php echo $this->Html->css('/plugins/switch/static/stylesheets/bootstrap-switch.css') ?>     
        
        <?php echo  $this->Html->css('admin/bootstrap-fileupload.min.css') ?>
        <?php echo  $this->Html->css('admin/layout2.css') ?> 
        <!--  ################################## CSS Added By Developer End Here  ############################################  -->    

        <?php echo $this->Html->script('/plugins/jquery-2.0.3.min.js') ?>

        <?php //echo $this->Html->script('jquery.min.js') ?>   
        <?php echo $this->Html->script('bootstrap.min.js') ?>
        <?php echo $this->Html->script('jquery.bxslider.js') ?>
        <?php echo $this->Html->script('masonry.js') ?>  
        
        <?php echo $this->Html->script('/plugins/dataTables/jquery.dataTables.js') ?>
        <?php echo $this->Html->script('/plugins/dataTables/dataTables.bootstrap.js') ?>
        
        <?php echo $this->Html->script('/plugins/validationengine/js/jquery.validationEngine.js') ?>
        <?php echo $this->Html->script('/plugins/validationengine/js/languages/jquery.validationEngine-en.js') ?>
        <?php echo $this->Html->script('/plugins/jquery-validation-1.11.1/dist/jquery.validate.min.js') ?>
        <?php echo $this->Html->script('validationInit.js') ?>
        <script> $(function(){ formValidation(); }); </script>

        <!-- <script> $(document).ready(function () { $('#dataTables-example').dataTable(); }); </script> -->

        <?php echo $this->Html->script('admin/jquery-ui.min.js') ?>
        <?php echo $this->Html->script('/plugins/uniform/jquery.uniform.min.js') ?>
        <?php echo $this->Html->script('/plugins/inputlimiter/jquery.inputlimiter.1.3.1.min.js') ?>
        <?php echo $this->Html->script('/plugins/chosen/chosen.jquery.min.js') ?>

        <?php echo $this->Html->script('/plugins/tagsinput/jquery.tagsinput.min.js') ?>
        <?php echo $this->Html->script('/plugins/validVal/js/jquery.validVal.min.js') ?>
        <?php echo $this->Html->script('/plugins/daterangepicker/daterangepicker.js') ?>
        <?php echo $this->Html->script('/plugins/daterangepicker/moment.min.js') ?>
        <?php echo $this->Html->script('/plugins/datepicker/js/bootstrap-datepicker.js') ?>
        <?php echo $this->Html->script('/plugins/timepicker/js/bootstrap-timepicker.min.js') ?>    
        <?php echo $this->Html->script('masonry.pkgd.min.js') ?> 
        <?php echo $this->Html->script('/plugins/jasny/js/bootstrap-fileupload.js') ?>
        
        
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        
        <?php echo $this->Html->script('jquery.raty-fa.js') ?>
        
        <style>
            .message.success{
                background: #5cb85c none repeat scroll 0 0;
                color: #fff;
                font-weight: bold;
                padding: 12px 10px;
                text-align: center;
                font-size : 18px;
            }
            .message.error{
                background: #fa693c none repeat scroll 0 0;
                color: #fff;
                font-weight: bold;
                padding: 12px 10px;
                text-align: center;
                font-size : 18px;
            }
        </style>    
            
        
        
    </head>
    <body>
        <?php echo $this->Flash->render() ?>
        <?php echo $this->Flash->render('success') ?>
        <?php echo $this->Flash->render('error') ?>

        <?php echo $this->element('header'); ?>

        <?php if ($this->request->params['controller'] == "Pages" && $this->request->params['action'] == "home") { ?>
        
             <?php echo $this->element('home_banner'); ?>
             <?php echo $this->fetch('content'); ?>         
        <?php } else if (($this->request->params['controller'] == "Users" && $this->request->params['action'] == "signin") || ($this->request->params['controller'] == "Users" && $this->request->params['action'] == "signup") || ($this->request->params['controller'] == "Users" && $this->request->params['action'] == "forgotpassword") || ($this->request->params['controller'] == "Users" && $this->request->params['action'] == "setpassword") || ($this->request->params['controller'] == "Users" && $this->request->params['action'] == "checkout") || ($this->request->params['controller'] == "Users" && $this->request->params['action'] == "addprescription") ) { ?>
            <?php echo $this->element('menu'); ?>
            <?php echo $this->fetch('content'); ?>      
        <?php } else if ($this->request->params['controller'] == "Treatments") { ?>
            <?php echo $this->element('menu'); ?>
            <div class="treatments-prices-banner-area">
                <div class="container">
                    <div class="row">
                        <div class="col-md-3 col-sm-3">
                            <?php echo $this->element('leftsidebar'); ?>
                        </div>
                        <div class="col-md-6 col-sm-6">
                            <?php echo $this->fetch('content'); ?>
                        </div>
                        <div class="col-md-3 col-sm-3">
                            <?php echo $this->element('rightsidebar'); ?>
                        </div>
                    </div>
                </div>
            </div>         
        <?php } else if ($this->request->params['controller'] == "Doctors") { ?>
            <?php echo $this->element('menu'); ?>
            <div class="treatments-prices-banner-area">
                <div class="container">
                    <div class="row">
                        <div class="col-md-3 col-sm-3">
                            <?php echo $this->element('doctor_sidebar'); ?>
                        </div>
                        <div class="col-md-9 col-sm-9">
                            <?php echo $this->fetch('content'); ?>
                        </div>
                    </div>
                </div>
            </div> 
        <?php } else { ?>
            <?php echo $this->element('menu'); ?>
            <div class="treatments-prices-banner-area">
                <div class="container">
                    <div class="row">
                        <div class="col-md-3 col-sm-3">
                            <?php echo $this->element('leftsidebar'); ?>
                        </div>
                        <div class="col-md-6 col-sm-6">
                            <?php echo $this->fetch('content'); ?>
                        </div>
                        <div class="col-md-3 col-sm-3">
                            <?php echo $this->element('rightsidebar'); ?>
                        </div>
                    </div>
                </div>
            </div>
        <?php } ?>
        
        <?php echo $this->element('footer'); ?>

    </body>



    <script type="text/javascript">

        $(document).ready(function () {
            $('.bxslider').bxSlider({
                minSlides: 4,
                maxSlides: 4,
                slideWidth: 200,
                slideMargin: 10,
                controls: false,
                autoControlsCombine:true,
                auto: true,
                autoControls: true
            });
            $('.bxslider2').bxSlider({
                auto: true,
                autoControls: true
            });
            $('.product_slider').bxSlider({
                minSlides: 4,
                maxSlides: 4,
                slideWidth: 300,
                slideMargin: 10,
                controls: false,
                autoControlsCombine:true,
                auto: true,
                autoControls: true
            });
        });
    </script>


    <script type="text/javascript">
        $(document).ready(function () {
            $('.account > a').click(function () {
                $('.account-holder').slideToggle('fast');
                $('.accounts-holder').slideUp('fast');
                return false;
            });
        });
    </script>
    
    <script type="text/javascript">
        $(document).ready(function () {
            $('.accounts > a').click(function () {
                $('.accounts-holder').slideToggle('fast');
                $('.account-holder').slideUp('fast');
                return false;
            });
        });
    </script>    
    <script type="text/javascript">
        $(window).scroll(function () {
            if ($(window).scrollTop() >= 89) {
                $('.navbar-inverse').addClass('fixed-header');
            }
            else {
                $('.navbar-inverse').removeClass('fixed-header');
            }
        });
    </script>
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&libraries=places&key=AIzaSyCTkgTknL3nwYbWD7mii-wvDowwk-6Izms&language=en-AU"></script>
    <script>
        var autocomplete = new google.maps.places.Autocomplete(
        /** @type {!HTMLInputElement} */(document.getElementById('address')),
        {types: ['geocode']});

        google.maps.event.addListener(autocomplete, 'place_changed', function() {
            var place = autocomplete.getPlace();
            console.log(place.address_components);
            //console.log(place.address_components['cities']['long_name']);
            //console.log(place.address_components['country']['long_name']);
            //console.log(place.address_components.locality);
            //console.log(place.address_components['2']['long_name']);
            //console.log(place.address_components['3']['long_name']);
            //console.log(place.address_components['4']['long_name']);
            //console.log(place.address_components['5']['long_name']);
            
            $('#city').val('');
            $('#region').val('');
            $('#country').val('');
            $('#postcode').val('');
            
            if(place.address_components['2'] && place.address_components['2']['long_name']){
                var city = place.address_components['2']['long_name'];
                $('#city').val(city);
            } else {
                $('#city').val('');
            }
            
            if(place.address_components['5'] && place.address_components['4']['long_name']){
                var region = place.address_components['5']['long_name'];
                $('#region').val(region);
            } else {
                $('#region').val('');
            }     
            
            if(place.address_components['6'] && place.address_components['6']['long_name']){
                var country = place.address_components['6']['long_name'];
                $('#country').val(country);
            } else {
                $('#country').val('');
            }            
            
            if(place.address_components['7'] && place.address_components['7']['long_name']){
                var postcode = place.address_components['7']['long_name'];
                $('#postcode').val(postcode);
            } else {
                $('#postcode').val('');
            }
        });
    </script>  
    
</html>

<?php //echo $this->element('sql_dump');  ?>
