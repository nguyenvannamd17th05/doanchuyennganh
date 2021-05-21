<head>
    <link rel="stylesheet" href="{{asset("css/bootstrap.min.css")}}" type="text/css">
    <script src="{{asset("js/jquery-3.3.1.min.js")}}"></script>
    <script src="{{asset("js/main.js")}}"></script>
</head>

@foreach ($size as $item)
<label for="{{$item->title}}-btn" class=" btn btn-light {{$item->amount==0?'disabled':''}}">
    <input type="radio" id="{{$item->title}}-btn" name="size"
        value="{{$item->title}}">
    {{$item->title}}
</label>
@endforeach



