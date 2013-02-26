<div id="alert_div">
     
</div>
<div class="user-edit-page">
    <h3>Edit page</h3>
    <form action="<?php echo URL::site('users/edit') ?>" method="POST" id="user-edit">
        <table class="table table-bordered table-striped">
                <tbody>
                        <tr>
                                <td><label for="first_tname">First Name:</label></td>
                                <td><input type="text" name="user[first_name]" id="first_name" value="<?php echo $user->first_name ?>"></td>
                        </tr>
                        <tr>
                                <td><label for="last_name">Last Name:</label></td>
                                <td><input type="text" name="user[last_name]" id="last_name" value="<?php echo $user->last_name ?>"></td>
                        </tr>
                        <tr>
                                <td><label>Contacts</label></td>
                                <td>
                                        <div class="input-prepend">
                                                <span class="add-on">S</span>
                                                <input class="span2" id="skype" name="user[skype]" type="text" placeholder="skype" value="<?php echo $user->skype ?>">
                                        </div>

                                        <div class="input-prepend">
                                                <span class="add-on"><i class="icon-envelope"></i></span>
                                                <input class="span2" id="email" type="text" placeholder="email" value="<?php echo $user->email ?>" readonly>
                                        </div>
                                        <div class="input-prepend">
                                                <span class="add-on">@</span>
                                                <input class="span2" id="twitter" name="user[twitter]" type="text" placeholder="twitter" value="<?php echo $user->twitter ?>">
                                        </div>
                                        <div class="input-prepend">
                                                <span class="add-on"><i class="icon-signal"></i></span>
                                                <input class="span2" id="twitter" name="user[phone]" type="text" placeholder="phone" value="<?php echo $user->phone ?>">
                                        </div>
                                         
                                </td>
                        </tr>
                        <tr>
                                <td><label>Password</label></td>
                                <td>
                                        <div class="input-prepend">
                                                <span class="add-on">O</span>
                                                <input class="span2" name="password[old]" type="password" placeholder="Old password">
                                        </div>

                                        <div class="input-prepend">
                                                <span class="add-on">N</span>
                                                <input class="span2" name="password[new]" type="password" placeholder="New password">
                                        </div>
                                        <div class="input-prepend">
                                                <span class="add-on">N</span>
                                                <input class="span2" name="password[new_confirm]" type="password" placeholder="New password confirmation">
                                        </div>
                                </td>
                        </tr>
                        <tr>
                            <td><label>Photo:</label></td>
                            <td id="photo">
                                    <input id="input-avatar" data-action="none" type="hidden" value="<?php echo $avatar_hidden ?>" name="avatar[avatar]"/>
                                    <input id="crop-avatar" data-action="none" type="hidden" value="" name="avatar[crop_avatar]"/>
                                    <div class="uploaded_avatar">
                                            <div class="left">
                                                    <div class="fileselector">
                                                            <input id="fileupload" type="file" name="file" data-url="<?php echo URL::site('uploader/temp');?>" enctype="multipart/form-data"/>
                                                    </div>
                                                    <figure class="full-avatar">
                                                            <img src="<?php echo $avatar ?>" alt="">
                                                    </figure>
                                            </div>
                                    </div>
                            </td>
                        </tr>
                        <tr>
                                <td></td>
                                <td>
                                        <input type="submit" class="btn" value="Save">
                                </td>
                        </tr>
                </tbody>
        </table>
    </form>
</div>