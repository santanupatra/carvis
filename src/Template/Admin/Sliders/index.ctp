<!--PAGE CONTENT -->
<div id="content">
    <div class="inner">
        <div class="row">
            <div class="col-lg-12">
                <h1 > Home Slider List </h1>
            </div>
        </div>
        <hr />
        <div class="row">
            <div class="col-lg-12">
                <div class="box">
                    <header>
                        <div class="icons"><i class="icon-th-large"></i></div>
                        <h5>Home Slider List</h5>
                        <div class="toolbar">
                            <ul class="nav">
                                <li style="margin-right:15px">
                                    <div class="btn-group" style=" margin-top: 8px">
                                        <a href="<?php echo $this->Url->build(["action" => "add"]); ?>"> <button class="btn btn-info btn-xs"><i class="icon-cogs icon-white"></i> Add Home Slider</button>  </a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </header>
                    <div id="collapseOne" class="accordion-body collapse in body">
                        <div class="col-sm-12">
                            <div class="row">                               
                                <div class="form-group"> 
                                    <div class="col-lg-12">
                                        <div class="table-responsive">
                                            <table class="table table-striped table-bordered table-hover">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 5%">Sl</th>
                                                        <th style="width: 40%"><?php echo $this->Paginator->sort('title') ?></th>
                                                        <th style="width: 30%"><?php echo $this->Paginator->sort('image') ?></th>
                                                        <th style="width: 30%"><?php echo __('Actions') ?></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php $i = 1; ?>
                                                    <?php foreach ($sliders as $dt): ?>  
                                                        <tr>
                                                            <td> <?php echo $i ?> </td>
                                                            <td><?php echo h($dt->title) ?></td>
                                                            <td>
                                                                <?php $filePath = WWW_ROOT . 'home_slider' . DS . $dt->file; ?>
                                                                <?php if ($dt->file != "" && file_exists($filePath)) { ?>
                                                                    <img src="<?php echo $this->Url->build('/home_slider/' . $dt->file); ?>" width="150px" height="70px" />
                                                                <?php } ?>
                                                            </td>
                                                            <td>
                                                                <a href="<?php echo $this->Url->build(["action" => "view", $dt->id]); ?>"> <button class="btn"><i class="icon-eye-open"></i> View</button> </a>
                                                                <a href="<?php echo $this->Url->build(["action" => "edit", $dt->id]); ?>"> <button class="btn btn-primary"><i class="icon-pencil icon-white"></i> Edit</button>  </a>
                                                                <a href="<?php echo $this->Url->build(["action" => "delete", $dt->id]); ?>" onclick="return confirm('Are you sure you want to delete?');" > <button class="btn btn-danger"><i class="icon-remove icon-white"></i> Delete</button> </a>
                                                            </td>
                                                        </tr>
                                                        <?php $i ++; ?>
                                                    <?php endforeach; ?>
                                                </tbody>
                                            </table>
                                            <div class="paginator">
                                                <ul class="pagination">
                                            <?php echo $this->Paginator->prev('< ' . __('previous')) ?>
                                            <?php echo $this->Paginator->numbers() ?>
                                            <?php echo $this->Paginator->next(__('next') . ' >') ?>
                                                </ul>
                                                <p><?php //echo $this->Paginator->counter() ?></p>
                                            </div>
                                        </div>  
                                    </div>
                                </div>                                
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>        
     </div>
</div>
<!--END PAGE CONTENT --> 