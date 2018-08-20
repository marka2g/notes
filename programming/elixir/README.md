# [elixir/erlang otp](https://elixir-lang.org/docs.html)

> "...take string concatenation. If you pop open the implementation of string concatenation in Perl, Ruby, or JavaScript, you are certain to find an if statement, a `realloc`, and a `memcpy`. That is, when you concatenate two strings, the first string is grown to make room for the second, and then the second is copied into the first. This approach has worked for decades and is the “obvious” thing to do. Erlang's approach is non-obvious, and, I believe, correct. In the usual case, Erlang does not use a contiguous chunk of memory to represent a sequence of bytes. Instead, it something called an “I/O list” — a nested list of non-contiguous chunks of memory. The result is that concatenating two strings (I/O lists) takes `O(1)` time in Erlang, compared `O(N)` time in other languages. This is why template rendering in Ruby, Python, etc. is slow, but very fast in Erlang."
[Evan Miller - Why I Program in Erlang](https://www.evanmiller.org/why-i-program-in-erlang.html)

[IO Lists in Elixir](https://www.bignerdranch.com/blog/elixir-and-io-lists-part-1-building-output-efficiently/)
[IO Lists in Phoenix](https://www.bignerdranch.com/blog/elixir-and-io-lists-part-2-io-lists-in-phoenix/)

> for example, Views in Phoenix ~> 1.3.3 contain an IO List for performance:
```elixir
view = RumblWeb.UserView.render("user.html", user: user)
#returns a tuple (:safe | IO List): {:safe, [[[[["" | "<strong>"] | "José"] | "</strong> ("] | "1"] | ")\n"]}
Phoenix.HTML.safe_to_string(view)
# then returns: "<strong>José</strong> (1)\n"
```

### elixir v. rails
[when to choose elixir](https://www.amberbit.com/blog/2015/12/22/when-choose-elixir-over-ruby-for-2016-projects/)
[evaluate rails json performance](https://robots.thoughtbot.com/how-to-evaluate-your-rails-json-api-for-performance-improvements)
[terraform - incremental api](https://medium.com/@sugarpirate/rise-from-the-ashes-incremental-apis-with-phoenix-b08cd66bd142)

#### interprocess communication - rails and elixir


#### soa
[wrap a rails api in phoenix](https://elixirforum.com/t/easiest-way-to-communicate-way-elixir-app-from-rails-from-project/1913/4)
[amazon's philosophy - lessons learned](http://apievangelist.com/2012/01/12/the-secret-to-amazons-success-internal-apis/)
[this rails api odin project how-to talks about amazon(besos's) mandate](https://mixandgo.com/learn/what-you-need-to-know-when-working-with-external-apis-in-rails)
[odin - building your own rails api](https://www.theodinproject.com/courses/ruby-on-rails/lessons/apis-and-building-your-own)
[awesome rails apis -> not quite related](https://collectiveidea.com/blog/archives/2013/06/13/building-awesome-rails-apis-part-1)

#### REST
[REST APIs are not databases! Build APIs around user contexts](https://medium.com/@marinithiago/guys-rest-apis-are-not-databases-60db4e1120e4)


### example apps
[10 amazing elixir examples](https://medium.com/aviabird/10-amazing-open-source-elixir-phoenix-apps-e2c52ee25053)

[learning elixir - good examples a bit old tho - joseph kain](http://learningelixir.joekain.com/elixir-application-design-posts/)

### rails puma v elixir puma showdown
[puma v cowboy](https://littlelines.com/blog/2014/07/08/elixir-vs-ruby-showdown-phoenix-vs-rails)

### elixir conf 2017
[all videos](https://www.youtube.com/channel/UC0l2QTnO1P2iph-86HHilMQ/videos)
[erlang solutions - has elixir 2018 videos too](https://www.youtube.com/user/ErlangSolutions/videos)

### books
- [programming phoenix](programming_phoenix/README.md)
- [meta programming elixir](https://pragprog.com/book/cmelixir/metaprogramming-elixir)

### courses
- [elixircasts - notes](elixircasts/README.md)
- [pragmatic studio - developing with elixir/otp - notes](pragmatic_studio/README.md)

### *views & reads*
- [i really don't care, do u? - chris mccords lonestar elixir_conf 2017 keynote](https://www.youtube.com/watch?v=tMO28ar0lW8)
- [ex_debug_toolbar github](https://github.com/kagux/ex_debug_toolbar)
- [killer tips - from awesome elixir](https://github.com/blackode/elixir-tips)

### *on deck views & reads*
### chris m
- [elixir macros - chris mccord](https://slides.com/chrismccord/elixir-macros#/1)
- [and, well, chris mccord](https://github.com/chrismccord?tab=repositories)
- [docyaaad repos](https://github.com/DockYard)
### concurrency v parallelism
- [what every node dev should know about elixir](https://www.youtube.com/watch?v=q8wueg2hswA&feature=youtu.be&t=37m4s)
- [the burrito shop](http://nathanmlong.com/2017/06/concurrency-vs-paralellism/)
### ddd
- [ddd](https://airbrake.io/blog/software-design/domain-driven-design)
- [bounded context](https://www.martinfowler.com/bliki/BoundedContext.html)
### cqrs
- [cqrs with elixir phoenix!!!](https://jfcloutier.github.io/jekyll/update/2015/11/04/cqrs_elixir_phoenix.html)
- [enterprise patterns pdf](http://disi.unal.edu.co/dacursci/sistemasycomputacion/docs/SWEBOK/Systems%20Engineering%20-%20EAA%20-%20Patterns%20of%20Enterprise%20Application%20Architecture%20-%20Addison%20Wesley.pdf)
- [from darth vader and the death start(thoughtworks)](https://www.martinfowler.com/bliki/CQRS.html)
  - [reporting db](https://www.martinfowler.com/bliki/ReportingDatabase.html)
  - [polyglot persistence](https://www.martinfowler.com/bliki/PolyglotPersistence.html)

### phoenix umbrella apps
- [sophie strikes again - elixir umbrella p1](https://www.thegreatcodeadventure.com/building-an-elixir-umbrella-app-part-1/)
- [sophie strikes again - elixir umbrella p2](https://www.thegreatcodeadventure.com/building-an-elixir-umbrella-app-react-part-2/)
- [sophie strikes again - elixir umbrella p3](https://www.thegreatcodeadventure.com/building-an-elixir-umbrella-app-part-3/)
- [elixir umbrellas](https://elixir-lang.org/getting-started/mix-otp/dependencies-and-umbrella-projects.html)
- [thoughtbot umbrellas](https://robots.thoughtbot.com/lessons-from-using-phoenix-1-3)
- [chris mccord lonestar - umbrella start](https://youtu.be/tMO28ar0lW8?t=27m54s)
- [getting to phoenix umbrella talk- luke imhoff](https://www.youtube.com/watch?v=1ocF_9Nc0ik)
- [umbrella test setup](https://elixirforum.com/t/umbrella-app-routing-with-plug-router-app-phoenix-app/10213/8)
- [set the port for each app differently](https://stackoverflow.com/questions/46479325/two-phoenix-apps-in-an-umbrella)
- [jose valim fix 1.3](https://github.com/obmarg/request_pot/pull/8)
- [hackernoon umbrella heroku deploy](https://hackernoon.com/deploying-a-phoenix-1-3-umbrella-app-to-heroku-452436b2b37f)

### ecto
- [ecto does not lazy load associations](https://hexdocs.pm/ecto/Ecto.html)
- [elixir forum on ecto](https://elixirforum.com/t/ecto-general-discussion-blog-posts-wiki/383)

### phoenix 1.3 and apis
- [build an api in phoenix 1.3](https://becoming-functional.com/building-a-rest-api-with-phoenix-1-3-part-1-9f8754aeaa87)
- [phoenix 1.3 pure love](https://swanros.com/2017/03/03/phoenix-1-3-is-pure-love-for-api-development/)

### elixircasts
- [intro to genserver](https://elixircasts.io/intro-to-genserver)
- [intro to agents](https://elixircasts.io/intro-to-agents)
- [concurrency with Task.async](https://elixircasts.io/concurrency-with-task.async_stream)
- [function plugs](https://elixircasts.io/intro-to-function-plugs)
- [module plugs](https://elixircasts.io/intro-to-module-plugs)
- [ecto queries](https://elixircasts.io/composing-ecto-queries)
- [feature_flags](https://elixircasts.io/feature-flags)
- [building static](https://elixircasts.io/static-site-with-elixir)
- [seeding](https://elixircasts.io/seeding-data-in-phoenix)
- [stripe](https://elixircasts.io/accepting-payments-with-stripe)

### thoughtbot elixir
- [thoughtbot elixir for rubyists](https://robots.thoughtbot.com/elixir-for-rubyists)

### realworld example meh
- [example app elixir - meh](https://github.com/gothinkster/elixir-phoenix-realworld-example-app)

### *docs*
### phoenix 1.3.3
- [guides/overview](https://hexdocs.pm/phoenix/overview.html)
- [modules](https://hexdocs.pm/phoenix/Phoenix.html)
- [mix tasks content](https://hexdocs.pm/phoenix/phoenix_mix_tasks.html#content)
- [plug api](https://hexdocs.pm/plug/readme.html)
- [plug conn](https://hexdocs.pm/plug/Plug.Conn.html)
- [ecto content](https://hexdocs.pm/phoenix/ecto.html#content)
- [ecto hex docs](https://hexdocs.pm/ecto/Ecto.html)

### elixir
- [getting started](https://elixir-lang.org/getting-started/introduction.html)
- [elixir school](https://elixirschool.com/en/)
- [operators](https://hexdocs.pm/elixir/operators.html#content)
- [learn x in y minutes](https://learnxinyminutes.com/docs/elixir/)
  - [learn u some erlang for great good](https://learnyousomeerlang.com/content)
  - [elixir cheat sheet](https://media.pragprog.com/titles/elixir/ElixirCheat.pdf)
-[mix commands](https://hexdocs.pm/phoenix/phoenix_mix_tasks.html#content)

### basic design
- [install b4 phoenix, a nice gist](https://gist.github.com/mbenatti/4866eaa5c424f66042e19cc055b21f83)
- [add bootstrap 4 to phoenix 1.3.3](http://candland.net/elixir/2018/02/04/sass_bootstrap_4_in_phoenix_1.3.html)
- [how to use bootstrap 4 to phoenix 1.3](http://whatdidilearn.info/2018/02/11/how-to-use-bootstrap-4-with-phoenix.html)
- [phoenix 1.3 bootstrap4 fontawesome](http://terrcin.io/2017/04/16/phoenix-1.3-with_bootstrap_4_and_font_awesome/)
- [phoenix 1.1.4 CRUD API and jwt auth](https://medium.com/@njwest/jwt-auth-with-an-elixir-on-phoenix-1-3-guardian-api-and-react-native-mobile-app-1bd00559ea51)
- [phoenix 1.1.4 CRUD API and vue - current](https://lobotuerto.com/blog/building-a-json-api-with-phoenix-and-elixir/)

### recursion and elixir
[recursion elixir](http://www.schmitty.me/phoenix-plug-and-sessions/)
[30 days of elixir](https://github.com/seven1m/30-days-of-elixir)
[tail call recursion in elixir](https://www.culttt.com/2016/06/06/understanding-recursion-tail-call-optimisation-elixir/)
[thinking recursively](http://langintro.com/elixir/article2/)

### Plug and Shopping Cart
[plug shopping cart example](http://www.schmitty.me/phoenix-plug-and-sessions/)

### blockchain
[building a blockchain in elixir](https://sheharyar.me/blog/writing-blockchain-elixir/)

### rideshare app example - otp
[montreal elixir ride share clone talk with josh nuss](https://www.youtube.com/watch?v=Hy1G2wz7DKI)
[montreal elixir talk code example with josh nuss](https://github.com/joshnuss/otp-talk)
