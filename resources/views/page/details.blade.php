@extends('index')
@section('page')
<div class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__links">
                    <a href="{{url('/')}}"><i class="fa fa-home"></i> Home</a>
                    <a href="{{url("product/$category->url")}}">{{$category->title}} </a>
                    <span>{{$product->title}}</span>
                </div>
            </div>
        </div>
    </div>
</div>
<section class="product-details spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-6" id="image_colors">
                <div class="product__details__pic">
                    <div class="product__details__pic__left product__thumb nice-scroll">
                        @foreach ($image as $item)
                        <a class="pt {{$loop->index==0?'active':''}}" href="#product-{{$loop->index+1}}">
                            <img src="{{asset("images/product/".$item->url)}}" alt="">
                        </a>
                        @endforeach
                    </div>
                    <div class="product__details__slider__content">
                        <div class="product__details__pic__slider owl-carousel">
                            @foreach ($image as $item)
                            <img data-hash="product-{{$loop->index+1}}" class="product__big__img"
                                src="{{asset("images/product/".$item->url)}}" alt="">
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="product__details__text">
                    <h3>{{$product->title}}<span>Brand: SKMEIMore Men Watches from SKMEI</span></h3>

                    <div class="product__details__price">{{number_format($product->price,0,'','.')}}
                        ₫<span>{{number_format($product->discount,0,'','.')}} ₫</span></div>
                    <p>{{$product->shortintroduction}}</p>


                    @csrf
                    <div class="product__details__button">
                        <div class="quantity">
                            <span>Quantity:</span>
                            <div class="pro-qty">
                                <input type="text" value="1" name="soluong" id="soluong">
                            </div>
                        </div>
                        <button type="submit" class="cart-btn" onclick="buy()"><span class="icon_bag_alt"></span>
                            Add to
                            cart</button>
                        <ul>
                            <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                            <li><a href="#"><span class="icon_adjust-horiz"></span></a></li>
                        </ul>
                    </div>
                    <div class="product__details__widget">
                        <ul>
                            <li>
                                <span>Màu sắc:</span>
                                <div class="btn-group btn-group-toggle" data-toggle="buttons">
                                    @foreach ($color as $item)
                                    <label class="btn btn-light {{$loop->index==0?'active':''}}">
                                        <input type="radio" name="color" id="option{{$loop->index+1}}"
                                            onclick="imagecolor({{$item->idcolorproduct}})"
                                            value="{{$item->idcolorproduct}}" {{$loop->index==0?"checked":""}}>
                                        {{$item->title}}
                                    </label>
                                    @endforeach
                                </div>
                            </li>
                            <li>
                                <span>Kích thước:</span>
                                <div class="btn-group btn-group-toggle" data-toggle="buttons" id="sizeAmount">
                                    @foreach ($size as $item)
                                    <label for="{{$item->title}}-btn"
                                        class=" btn btn-light {{$item->amount==0?'disabled':''}}">
                                        <input type="radio" id="{{$item->title}}-btn" name="size"
                                            value="{{$item->title}}" {{$item->amount==0?'disabled':''}}>
                                        {{$item->title}}
                                    </label>
                                    @endforeach
                                </div>
                            </li>
                            <li>
                                <span>Promotions:</span>
                                <p>Free shipping</p>
                            </li>
                        </ul>

                    </div>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="product__details__tab">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">Description</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">Specification</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab">Reviews ( 2 )</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tabs-1" role="tabpanel">
                            <h6>Description</h6>
                            {!!$product->introduce!!}
                        </div>
                        <div class="tab-pane" id="tabs-2" role="tabpanel">
                            <h6>Specification</h6>
                            <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut loret fugit,
                                sed
                                quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt loret.
                                Neque porro lorem quisquam est, qui dolorem ipsum quia dolor si. Nemo enim ipsam
                                voluptatem quia voluptas sit aspernatur aut odit aut loret fugit, sed quia ipsu
                                consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Nulla
                                consequat massa quis enim.</p>
                            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula
                                eget
                                dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient
                                montes,
                                nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu,
                                pretium
                                quis, sem.</p>
                        </div>
                        <div class="tab-pane" id="tabs-3" role="tabpanel">
                            <h6>Reviews ( 2 )</h6>
                            <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut loret fugit,
                                sed
                                quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt loret.
                                Neque porro lorem quisquam est, qui dolorem ipsum quia dolor si. Nemo enim ipsam
                                voluptatem quia voluptas sit aspernatur aut odit aut loret fugit, sed quia ipsu
                                consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Nulla
                                consequat massa quis enim.</p>
                            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula
                                eget
                                dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient
                                montes,
                                nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu,
                                pretium
                                quis, sem.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="related__title">
                    <h5>RELATED PRODUCTS</h5>
                </div>
            </div>
            @foreach ($categoryproduct as $item)
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="product__item">
                    <div class="product__item__pic set-bg" data-setbg="{{asset("images/product/$item->urlimage")}}">
                        <div class="label new">New</div>
                        <ul class="product__hover">
                            <li><a href="{{asset("images/product/$item->urlimage")}}" class="image-popup"><span
                                        class="arrow_expand"></span></a></li>
                            <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6><a href="{{url("sanpham/$item->url")}}">{{$item->title}}</a></h6>
                        <div class="product__price">{{$item->price}}</div>
                    </div>
                </div>
            </div>
            @endforeach

        </div>
    </div>
</section>
@endsection
@section('js')
<script type="text/javascript">
    function buy(e){
        var fd = new FormData();
        fd.append( '_token', $("input[name='_token']").val());
        fd.append( 'soluong', $("input[name='soluong']").val());
        fd.append( 'color', $("input[name='color']:checked").val());
        fd.append( 'size', $("input[name='size']:checked").val());
        $.ajax({
        url: '{{url("addCart?id=$product->idproduct")}}',
        data: fd,
        processData: false,
        contentType: false,
        method: 'POST',
        success: function(data){
            alertify.set('notifier','position', 'top-center');
            alertify.success('Thêm sản phẩm vào giỏ hàng thành công');
            $("#change-item-cart").empty();
            $("#change-item-cart").html(data);
        },
        error: function(data){
            var errors = data.responseJSON;
            $.each( errors.errors, function( key, value ) {
                alertify.set('notifier','position', 'top-center');
                alertify.error(value);
            });
        }
        });
    }
    function imagecolor(id){
        $.ajax({
            url:'{{url("image?id=")}}'+ id,
            processData:false,
            contentType:false,
            method:'GET',
        }).done(function(data){
            $('#image_colors').empty();
            $('#image_colors').html(data);
            $('#image_colors').children('meta,link,title,style,script').remove();
        });
        $.ajax({
            url:'{{url("size?id=")}}'+ id,
            processData:false,
            contentType:false,
            method:'GET',
        }).done(function(data){
            $('#sizeAmount').empty();
            $('#sizeAmount').empty();
            $('#sizeAmount').html(data);
            $('#sizeAmount').children('meta,link,title,style,script').remove();
        })
    }

</script>
@endsection
