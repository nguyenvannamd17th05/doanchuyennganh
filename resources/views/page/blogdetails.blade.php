@extends('index')

@section('page')
 <section class="blog-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <div class="blog__details__content">
                        <div class="blog__details__item">
                            <img src="img/blog/details/blog-details.jpg" alt="">
                            <div class="blog__details__item__title">
                                <span class="tip">Street style</span>

                                <h4>{{$news->title}}</h4>
                                <ul>
                                    <li>by <span>{{$news->name}}</span></li>
                                    <li>{{$news->date_create}}</li>
                                </ul>
                            </div>
                        </div>
                        <div class="blog__details__desc">
                           {!! $news->content !!}
                        </div>
                       
                    </div>
                </div>
                
            </div>
        </div>
    </section>

    @endsection