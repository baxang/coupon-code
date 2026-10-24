# CouponCode

[CouponCode 루비 젬][rubygems](Ruby Gem)은 전자상거래 서비스 등에서 사용하기 적합한 쿠폰 코드를 만들고 검증하는 기능을 제공합니다.

이 젬(Gem)은 [Grant][grant]가 펄(Perl) 언어로 작성한 [Algorithm::CouponCode][couponcode]를 루비(Ruby) 언어로 옮겨 구현한 것입니다.

젬의 기본 설정으로 생성되는 코드는 XXXX-XXXX-XXXX 형식이며 각 3부분은 4자의 숫자와 알파벳으로 구성됩니다. 이 젬이 만드는 쿠폰 코드의 특징은 다음과 같습니다.

 - 만들어진 코드는 대/소문자를 구분하지 않습니다. 검증할 때 입력값을 대문자로 바꾼 뒤 확인합니다.
 - 숫자와 헷갈리기 쉬운 알파벳 I, O, S, Z는 사용하지 않습니다. 원본 펄 모듈은 이 점을 이용해 O를 0으로(비슷하게 I는 1, S는 5, Z는 2) 자동 교정하지만, 이 젬은 자동 교정을 하지 않습니다. 검증할 때 코드에 쓰이지 않는 글자는 지워질 뿐 다른 글자로 바뀌지 않으므로, 0 대신 O를 입력한 코드는 검증에 실패합니다.
 - 각 부분의 마지막 글자는 검증코드(check-digit)입니다. 기본 길이에서는 4번째 글자이고, `part_length`로 길이를 바꾸면 그 길이의 마지막 글자가 됩니다. 덕분에 사용자가 실수로 코드를 잘못 입력했는지 확인할 수 있습니다.
 - 검증코드 알고리즘은 각 부분의 순서와 연관됩니다. 따라서 '1K7Q'라는 코드는 코드의 첫 번째 부분으로는 유효하지만 코드의 두 번째에 위치하면 유효하지 않게 됩니다.

하지만 현 시점에는 펄 버전이 가진 세심하고 다양한 기능이 모두 구현되어 있지 않다는 점을 기억해 주십시오.
평문을 입력해 코드를 생성하는 기능이나 자동교정, 금칙어 걸러내기, 글자 순서가 뒤바뀌어도 검증코드가 맞는 코드를 건너뛰는 기능, 그리고 클라이언트 상에서의 코드 검증을 위한 jQuery 플러그인은 포함되어 있지 않습니다.

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

## 옵션

쿠폰 코드를 만들 때 아래와 같이 옵션값을 넣어, 기본 설정인 3부분이 아닌 쿠폰 코드를 얻을 수 있습니다. 

    >> CouponCode.generate(parts: 4)
    => "7YQH-1FU7-E1HX-0BG9"
    >> CouponCode.validate("7YQH-1FU7-E1HX-0BG9", parts: 4)
    => "7YQH-1FU7-E1HX-0BG9"

각 부분의 길이도 아래와 같이 바꿀 수 있습니다.

    >> CouponCode.generate(parts: 3, part_length: 5)
    => "GRG65-X0PF4-KP7TJ"
    >> CouponCode.validate("GRG65-X0PF4-KP7TJ", parts: 3, part_length: 5)
    => "GRG65-X0PF4-KP7TJ"

## 테스팅

스펙 실행:

```sh
$ bundle exec rake spec
```

린트 실행([Standard](https://github.com/standardrb/standard)):

```sh
$ bundle exec standardrb
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
[license]: https://github.com/baxang/coupon-code/blob/master/LICENSE.txt
[rubygems]: https://rubygems.org/gems/coupon_code
