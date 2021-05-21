@extends('index')

@section('page')

<section class="blog spad">
        <div class="container">
            <div class="row">
                @foreach($news as $value)
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic large__item set-bg" data-setbg="{{asset("images/product/$value->url")}}"></div>
                        <div class="blog__item__text">
                            <h6><a href="{{url("blogdetails/$value->id")}}">{{$value->title}}</a></h6>
                            <ul>
                                <li>by <span>{{$value->name}}</span></li>
                                <li>{{$value->date_create}}</li>
                            </ul>
                        </div>
                    </div>
                </div>
                @endforeach
               
                <div class="col-lg-12 text-center">
                    <a href="#" class="primary-btn load-btn">Load more posts</a>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->

    @endsection