@extends('admin')
@section('pageadmin')
<div class="container-fluid">
  <div class="card shadow mb-4">
    <div class="card-header py-3">
    </div>
    <div class="card-body">
      <div class="table-responsive">
        <form class="form-horizontal" action="{{route('admins.nhansu.themregister')}}" method="POST">
          @csrf
          <fieldset>
            <div id="legend">
              <legend class="">Tạo tài khoản nhân sự</legend>
            </div>
            <div class="control-group">
              <!-- Username -->
              <label class="control-label"  for="name">Họ và tên</label>
              <div class="controls">
                <input type="text" id="name" name="name" placeholder="Nhập họ tên" class="input-xlarge">
              </div>
            </div>
            
            <div class="control-group">
              <!-- E-mail -->
              <label class="control-label" for="email">E-mail</label>
              <div class="controls">
                <input type="text" id="email" name="email" placeholder="" class="input-xlarge">
              </div>
            </div>
            
            <div class="control-group">
              <!-- Password-->
              <label class="control-label" for="password">Mật khẩu</label>
              <div class="controls">
                <input type="password" id="password" name="password" placeholder="" class="input-xlarge">
              </div>
            </div>
            <div class="control-group">
              <label for="exampleFormControlSelect1">Phân quyền</label>
              <select class="form-control" id="exampleFormControlSelect1" name="role">
                @foreach ($role as $roles)
                @if ($roles->id == 0)
                    @continue
                @endif
                    <option value="{{$roles->id}}">{{$roles->name}}</option>
                @endforeach
                
              </select>
            </div>
            
            <div class="control-group">
              <!-- Button -->
              <br>
              <div class="controls">
                <input type="submit"  class="btn btn-success" value="Tạo tài khoản">
              </div>
            </div>
          </fieldset>
        </form>
      </div>
    </div>
  </div>
</div>
@endsection
@section('dataTable',)
@include('admin.pluginjs.datatable')
@endsection