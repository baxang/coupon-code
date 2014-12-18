# CouponCode

이 루비 젬(Ruby Gem)은 쿠폰 코드를 만들고 검증하는 기능을 제공합니다.

이 젬(Gem)은 [Grant][grant]가 작성한 [Algorithm::CouponCode][couponcode]를 루비(Ruby) 언어로 옮겨 구현한 것입니다.
하지만 현 시점에는 원작이 가진 기능 중 기본적인 코드 생성/검증 기능만 구현되어 있다는 점을 주지해 주십시오. 평문을 입력해 코드를 생성하는 기능이나
자동교정, jQuery 플러그인 등은 포함되어있지 않습니다.

이 루비 젬은 [https://stripes.co.kr](https://stripes.co.kr)를 위해 개발됐습니다.

## 설치

애플리케이션의 Gemfile에 아래의 코드 한 줄을 추가하십시오:

    gem 'coupon_code'

그리고 다음 명령을 실행하십시오:

    $ bundle

또는 아래와 같이 직접 설치해 사용하십시오:

    $ gem install coupon_code

## 사용방법

    >> require 'coupon_code'
    >> code = CouponCode.generate
    => "1K7Q-CTFM-LMTC"
    >> CouponCode.validate(code)
    => "1K7Q-CTFM-LMTC"
    >> CouponCode.validate('1K7Q-CTFM-LMTO') # Invalid code
    => nil

## 테스팅

```ruby
$ bundle exec rake test
```
## Thanks to

 - 펄로 작성된 [Grant McLean][grant]의 [Algorithm::CouponCode][couponcode]
 - 자바스크립트로 작성된 [Andrew Chilton][chilts]의 [NodeJS implementation][node-couponcode]

## 라이센스

MIT. 자세한 내용은 [LICENSE][license]를 읽어주십시오.

## 기여하기

1. 이 저장소를 포크합니다.
2. 새 기능을 위한 브랜치를 만듭니다. (`git checkout -b my-new-feature`)
3. 작업한 변경 내역을 커밋합니다. (`git commit -am 'Add some feature'`)
4. 깃헙 저장소의 브랜치에 푸시합니다. (`git push origin my-new-feature`)
5. 풀 리퀘스트(Pull Request)를 해주십시오.

[grant]: https://github.com/grantm/
[couponcode]: https://github.com/grantm/Algorithm-CouponCode
[chilts]: https://github.com/chilts
[node-couponcode]: https://github.com/chilts/node-coupon-code
[license]: https://raw.github.com/appsattic/node-coupon-code/master/LICENSE