<!-- Modal -->
<div class="modal fade" id="signupModal" tabindex="-1" role="dialog" aria-labelledby="signupModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="signupModalLabel">Signup for an iDiscuss Account</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
    




      <form action = "_handleSignup.php" method = "post">
      <div class="modal-body">
  <div class="form-group">
    <label for="exampleInputEmail1">Username</label>
    <!-- <input type="email" class="form-control" id="signupEmail" name = "signupEmail" aria-describedby="emailHelp" placeholder="Enter email"> -->
    <input type="text" class="form-control" id="signupEmail" name = "signupEmail" aria-describedby="emailHelp" placeholder="Enter username">
    <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" id="signupPassword" name= "signupPassword" placeholder="Password">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Confirm Password</label>
    <input type="password" class="form-control" id="signupcPassword" name = "signupcPassword" placeholder="Confirm your Password">
    <small id="emailHelp" class="form-text text-muted">Make sure your password must be same.</small>
  </div>
  <button type="submit" class="btn btn-primary">SignUp</button>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
</form>
    </div>
  </div>
</div>