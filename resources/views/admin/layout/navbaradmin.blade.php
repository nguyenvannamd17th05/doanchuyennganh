<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
<a class="sidebar-brand d-flex align-items-center justify-content-center" href="{{route('admin.home')}}">
      <div class="sidebar-brand-icon rotate-n-15">
        <i class="fas fa-laugh-wink"></i>
      </div>
      <div class="sidebar-brand-text mx-3">Shop 7760</div>
    </a>

    <hr class="sidebar-divider">

        @if(Auth::user()->id_role==1||Auth::user()->id_role==2)
    <li class="nav-item ">
        <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseTwo">
          <span>Sản phẩm</span>
        </a>
        <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionSidebar" style="">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="{{route('admins.sanpham.index')}}">Danh sách sản phẩm</a>
            <a class="collapse-item" href="{{route('admins.sanpham.them')}}">Thêm sản phẩm</a>
          </div>
        </div>
      </li>
      @endif
      <hr class="sidebar-divider">
      @if(Auth::user()->id_role==1||Auth::user()->id_role==2)
      <li class="nav-item ">
        <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <span>Danh mục</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar" style="">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="{{route('admins.danhmuc.index')}}">Danh sách danh mục</a>
            <a class="collapse-item" href="{{route('admins.danhmuc.them')}}">Thêm danh mục</a>
          </div>
        </div>
      </li>
      @endif
       @if(Auth::user()->id_role==1||Auth::user()->id_role==2)
      <li class="nav-item ">
        <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapse3" aria-expanded="true" aria-controls="collapseTwo">
          <span>Khách hàng</span>
        </a>
        <div id="collapse3" class="collapse" aria-labelledby="heading3" data-parent="#accordionSidebar" style="">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="{{route('admins.khachhang.index')}}">Danh sách khách hàng</a>
          </div>
        </div>
      </li>
      @endif
      @if(Auth::user()->id_role==1)
      <li class="nav-item ">
        <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapse5" aria-expanded="true" aria-controls="collapseTwo">
          <span>Nhân sự</span>
        </a>
        <div id="collapse5" class="collapse" aria-labelledby="heading3" data-parent="#accordionSidebar" style="">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="{{route('admins.nhansu.list')}}">Danh sách nhân viên</a>
            <a class="collapse-item" href="{{route('admins.nhansu.register')}}">Thêm nhân viên</a>
          </div>
        </div>
      </li>
      @endif
      @if(Auth::user()->id_role==1||Auth::user()->id_role==3)
      <li class="nav-item ">
        <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapse6" aria-expanded="true" aria-controls="collapseTwo">
          <span>Tin tức</span>
        </a>
        <div id="collapse6" class="collapse" aria-labelledby="heading3" data-parent="#accordionSidebar" style="">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="{{route('admins.tintuc.insert')}}">Tạo bài viết</a>
          </div>
        </div>
      </li>
      @endif
    <!-- Divider -->
    @if(Auth::user()->id_role==1||Auth::user()->id_role==4)
    <hr class="sidebar-divider d-none d-md-block">
    <li class="nav-item ">
        <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapse4" aria-expanded="true" aria-controls="collapseTwo">
          <span>Đơn hàng</span>
        </a>
        <div id="collapse4" class="collapse" aria-labelledby="heading3" data-parent="#accordionSidebar" style="">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="{{route('admins.donhan.chuaxuly')}}">Đơn hàng chưa xử lý</a>
            <a class="collapse-item" href="{{route('admins.khachhang.hoanthanh')}}">Đơn hàng đã xử lý</a>
          </div>
        </div>
      </li>
      @endif
    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
      <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

  </ul>
  <!-- End of Sidebar -->
