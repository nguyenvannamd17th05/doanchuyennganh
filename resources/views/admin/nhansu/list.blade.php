@extends('admin')
@section('pageadmin')

<div class="container-fluid">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Danh sách nhân sự</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table " width="100%" cellspacing="0" id="dataTableList">
                    <thead>
                        <tr>
                            <th>STT</th>
                            <th>Email</th>
                            <th>Tên</th>
                            <th>Quyền hạn</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($user as $item)
                        <tr>
                            <td>{{$loop->index+1}}</td>
                            <td>{{$item->email}}</td>
                            <td>{{$item->name}}</td>
                            <td>{{$item->rolename}}</td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
@endsection
@section('dataTable',)
@include('admin.pluginjs.datatable')
@endsection
