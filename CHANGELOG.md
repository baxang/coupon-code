## CHANGELOG

### 0.0.1
 - Implement CouponCode.generate(parts: n)/validate().

### 0.0.2
 - Bug fix `.validate` can't handle invalid characters and produces an error. (mrclmrvn)

### 0.0.3
 - add ability to specify length #15 (fourcolors)

### 0.1.0
 - **Behaviour change:** `.validate` now returns `nil` for codes with a wrong check digit. 0.0.3 accepted them by mistake. (#17)
 - Generate codes with `SecureRandom` instead of `rand`. (#17)
 - Ruby 4 support: frozen string literals, no warnings. (#17)
 - Tested on Ruby 2.6 to 4.0; the gem ships only the files it needs and requires MFA to publish. (#18)
 - Fix `.generate` hanging when only `part_length:` is given, and stop it emptying the options hash passed in. (#19)
