<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!-- 忘記密碼-->
		<div class="modal fade"  id="forgetpwd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-sm">
		  	<div class="modal-content ">
		  	<!-- header-->
		  	<div class="modal-header">
       			 <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        		 <h3 class="modal-title" id="myModalLabel">Goo-go 忘記密碼 <small>forget password</small></h3>
      		</div><!-- /.header-->
      		<!-- body-->
      		<div class="modal-body">
			<div class="row">
			<div class="col-md-10 col-md-offset-1">
			<!-- form-->
		      <form role="form">
		        <div class="form-group">
		          <label > E-mail:</label>
		          <input type="text" class="form-control" id="inputEmail">
		        </div>
		        <div class="form-group">
                        <label><input type="radio" name="optionsRadios" id="member" value="1">一般會員</label>
                        <label><input type="radio" name="optionsRadios" id="company" value="0">商家會員</label>
                </div>
		        <button type="submit" class="btn btn-lg btn-primary pull-right">寄新密碼</button>
		      </form><!-- /.form-->
 			</div>
 		    </div>
 		</div><!-- /.body-->
 		</div>
		</div>
		</div>
		<!-- /.忘記密碼-->