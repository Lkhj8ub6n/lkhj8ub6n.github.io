# Chapter 3 — Conditional Execution
### Python for Everybody — ملف الدراسة الشامل (إنجليزي + شرح عربي + تلميحات امتحان)

---

## 1. Conditional Steps (الخطوات الشرطية)

```python
x = 5
if x < 10:
    print('Smaller')
if x > 20:
    print('Bigger')

print('Finish')
```

**Output:**
```
Smaller
Finish
```

> 💡 **توضيح بالعربي:**
> البرنامج بيمشي سطر سطر من فوق لتحت. عند كل `if` بيفحص الشرط: إذا **True** بينفّذ الكتلة المُزاحة (indented) تحته، وإذا **False** بيتخطّاها ويكمل.
> هون: `5 < 10` صحيح → طبع `Smaller`. و `5 > 20` خطأ → تخطّى `Bigger`. وسطر `print('Finish')` **مش داخل أي if** فبينفّذ دائماً.

> ⚠️ **انتبه للامتحان:**
> هاي أشهر سؤال Output بالشابتر. المفتاح: الـ `if`ات المنفصلة **كلها بتتفحص واحدة واحدة** — مش زي `elif` اللي بتوقف عند أول شرط صحيح.

---

## 2. Comparison Operators (عوامل المقارنة)

**Boolean expressions ask a question and produce a Yes or No result which we use to control program flow. Comparison operators look at variables but do not change the variables.**

| Python | Meaning |
|---|---|
| `<` | Less than |
| `<=` | Less than or Equal to |
| `==` | Equal to |
| `>=` | Greater than or Equal to |
| `>` | Greater than |
| `!=` | Not equal |

**Remember: `=` is used for assignment.**

```python
x = 5
if x == 5 :
    print('Equals 5')
if x > 4 :
    print('Greater than 4')
if x >= 5 :
    print('Greater than or Equals 5')
if x < 6 : print('Less than 6')
if x <= 5 :
    print('Less than or Equals 5')
if x != 6 :
    print('Not equal 6')
```

**Output:**
```
Equals 5
Greater than 4
Greater than or Equals 5
Less than 6
Less than or Equals 5
Not equal 6
```

> 💡 **توضيح بالعربي:**
> كل الشروط الستة صحيحة لأن `x = 5`، فطُبعت كل الأسطر. لاحظ إنه ممكن تكتب الـ `if` بسطر واحد: `if x < 6 : print('Less than 6')` — صحيحة نحوياً لكن غير مفضّلة.
> والـ Boolean expression بترجع قيمة من نوع `bool` وهي إما `True` أو `False` (بحرف كبير بالبداية!).

> 🚨 **خطأ شائع — أهم فرق بالشابتر:**
> | العلامة | الوظيفة | مثال |
> |---|---|---|
> | `=` | **Assignment** — إسناد قيمة | `x = 5` |
> | `==` | **Comparison** — مقارنة | `if x == 5:` |
>
> لو كتبت `if x = 5:` → **SyntaxError**.

> ⚠️ **انتبه للامتحان (سؤال شبه مؤكد):**
> "أي مما يلي **ليس** عامل مقارنة صحيح بـ Python؟" الجواب: **`<>`**
> كانت مستخدمة في Python 2 القديمة، لكنها **غير صالحة نهائياً في Python 3**. البديل هو `!=`.
> وكمان انتبه: `=<` و `=>` **خاطئتان** — الصحيح `<=` و `>=` (علامة المساواة دائماً بالآخر).

---

## 3. One-Way Decisions (القرار أحادي الاتجاه)

```python
x = 5
print('Before if 5')
if x == 5 :
    print('Is 5')
    print('Is Still 5')
    print('Third 5')
print('Afterwards if 5')

print('Before if 6')
if x == 6 :
    print('Is 6')
    print('Is Still 6')
    print('Third 6')
print('Afterwards if 6')
```

**Output:**
```
Before if 5
Is 5
Is Still 5
Third 5
Afterwards if 5
Before if 6
Afterwards if 6
```

> 💡 **توضيح بالعربي:**
> الـ `if` الأولى تحقق شرطها فطُبعت أسطرها الثلاثة كلها. الثانية `x == 6` خطأ فتم **تخطي الكتلة كاملة** (الثلاث أسطر دفعة واحدة) — لكن `Before if 6` و `Afterwards if 6` طُبعا لأنهما **خارج** الكتلة.

> ⚠️ **انتبه للامتحان:**
> السؤال بيكون: "كم سطر يُطبع؟" — لازم تعدّ بدقة أي الأسطر مُزاحة وأيها لا. الإزاحة هي المعيار الوحيد.

---

## 4. Indentation (الإزاحة) — أهم مفهوم بالشابتر

- **Increase indent after an `if` statement or `for` statement (after `:`)**
- **Maintain indent to indicate the scope of the block** (which lines are affected by the if/for)
- **Reduce indent** back to the level of the if/for statement to indicate the **end of the block**
- **Blank lines are ignored** — they do not affect indentation
- **Comments on a line by themselves are ignored** with regard to indentation

```python
x = 5
if x > 2 :
    print('Bigger than 2')      # داخل الـ if
    print('Still bigger')       # داخل الـ if
print('Done with 2')            # خارج الـ if — ينفّذ دائماً

for i in range(5) :
    print(i)
    if i > 2 :
        print('Bigger than 2')  # Nested Block
    print('Done with i', i)
print('All Done')
```

> 💡 **توضيح بالعربي:**
> بلغات مثل C و Java الكتل تُحدَّد بالأقواس `{ }`، أما Python فتستخدم **الإزاحة نفسها** كجزء من قواعد اللغة. يعني المسافات البيضاء عندها معنى تنفيذي، مش مجرد تنسيق جمالي.
> المعيار الشائع: **4 مسافات** لكل مستوى.

> 🚨 **خطأ شائع — سؤال Bug مضمون:**
> ```python
> x = 5
> if x > 2 :
> print('Bigger')       # ← IndentationError
> ```
> بعد النقطتين `:` **لازم** يكون في إزاحة. الرسالة: `IndentationError: expected an indented block`.
>
> وكذلك النسيان الأشهر:
> ```python
> if x > 2               # ← SyntaxError: نسيان النقطتين
>     print('Bigger')
> ```

> ⚠️ **انتبه للامتحان:**
> السطر الفارغ **لا يُنهي** الكتلة، والتعليق `#` وحده كذلك. اللي بينهي الكتلة هو **رجوع الإزاحة** لمستوى أقل فقط.

---

## 5. Nested Decisions (القرارات المتداخلة)

```python
x = 42
if x > 1 :
    print('More than one')
    if x < 100 :
        print('Less than 100')
print('All done')
```

**Output:**
```
More than one
Less than 100
All done
```

> 💡 **توضيح بالعربي:**
> الـ `if` الداخلية بتُفحص **فقط** إذا كانت الخارجية صحيحة. لو كانت `x = 0` مثلاً، الشرط الخارجي `0 > 1` خطأ → الكتلة كاملة (بما فيها الـ if الداخلية) بتنترك، والناتج بيكون `All done` فقط.

> ⚠️ **انتبه للامتحان:**
> فرّق بين المتداخلة والمتسلسلة:
> ```python
> # متداخلة: الثانية مشروطة بالأولى
> if x > 10:
>     if x < 20:
>         print('Between')
>
> # متسلسلة: كل واحدة مستقلة
> if x > 10:
>     print('A')
> if x < 20:
>     print('B')
> ```

---

## 6. Two-way Decisions with `else:` (القرار ثنائي الاتجاه)

**Sometimes we want to do one thing if a logical expression is true and something else if the expression is false. It is like a fork in the road — we must choose one or the other path but not both.**

```python
x = 4

if x > 2 :
    print('Bigger')
else :
    print('Smaller')

print('All done')
```

**Output:**
```
Bigger
All done
```

> 💡 **توضيح بالعربي:**
> مع `else` واحد **بالضبط** من الفرعين بينفّذ — مستحيل الاثنان معاً، ومستحيل ولا واحد. لاحظ إنو `else` **بدون شرط** ونقطتين بعدها مباشرة: `else :`.

> 🚨 **خطأ شائع:**
> `else` لازم تكون بنفس مستوى إزاحة الـ `if` التابعة لها بالضبط، وما بتقدر تكتب `else x < 2:` — الـ `else` ما بتاخد شرط أبداً.
> وكمان: `else` لحالها بدون `if` قبلها → **SyntaxError**.

---

## 7. Multi-way Decisions with `elif` (القرار متعدد الاتجاهات)

```python
if x < 2 :
    print('small')
elif x < 10 :
    print('Medium')
else :
    print('LARGE')
print('All done')
```

**التتبّع لقيم مختلفة:**

| قيمة x | المسار | Output |
|---|---|---|
| `x = 0` | `0 < 2` ✔ | `small` + `All done` |
| `x = 5` | `5 < 2` ✘ → `5 < 10` ✔ | `Medium` + `All done` |
| `x = 20` | كلاهما ✘ → else | `LARGE` + `All done` |

> 💡 **توضيح بالعربي:**
> `elif` = اختصار لـ `else if`. Python بتفحص الشروط **بالترتيب من فوق لتحت**، وأول شرط يتحقق **بتنفّذ كتلته وبتخرج من السلسلة كاملة** — الشروط الباقية ما بتنفحص إطلاقاً حتى لو كانت صحيحة.

> ⚠️ **انتبه للامتحان — أهم فرق بالشابتر كله:**
> ```python
> x = 5
> # سلسلة elif → مخرج واحد فقط
> if x > 1: print('A')
> elif x > 2: print('B')     # ما بتنفحص أصلاً
> # Output: A
>
> # ifات منفصلة → كلها بتتفحص
> if x > 1: print('A')
> if x > 2: print('B')
> # Output: A ثم B
> ```

### With Else / No Else

```python
# No Else
x = 5
if x < 2 :
    print('Small')
elif x < 10 :
    print('Medium')
elif x < 20 :
    print('Big')
elif x < 40 :
    print('Large')
elif x < 100 :
    print('Huge')
print('All done')
```

> 💡 **توضيح بالعربي:**
> بدون `else` من الممكن ألا يُنفَّذ **أي** فرع نهائياً (مثلاً لو `x = 500`). أما مع وجود `else` فمضمون تنفيذ فرع واحد دائماً.
> و `else` إن وُجدت لازم تكون **الأخيرة** — ما بتقدر تحط `elif` بعدها.

---

## 8. Multi-way Puzzles (الألغاز) — سؤال امتحان مضمون

**Which will never print regardless of the value for `x`?**

**اللغز الأول:**
```python
if x < 2 :
    print('Below 2')
elif x < 20 :
    print('Below 20')
elif x < 10 :
    print('Below 10')
else :
    print('Something else')
```
**الجواب:** `'Below 10'` **لن تُطبع أبداً**.

> 💡 **توضيح بالعربي:**
> أي قيمة أقل من 10 هي بالضرورة أقل من 20، فبتنمسك من الشرط `x < 20` اللي قبلها. الشرط الأضيق جاء بعد الأوسع → صار **ميتاً (unreachable)**.
> **القاعدة الذهبية:** في سلسلة `elif` رتّب الشروط من **الأضيق للأوسع** وإلا صارت فروع ميتة.

**اللغز الثاني:**
```python
if x < 2 :
    print('Below 2')
elif x >= 2 :
    print('Two or more')
else :
    print('Something else')
```
**الجواب:** `'Something else'` **لن تُطبع أبداً**.

> 💡 **توضيح بالعربي:**
> الشرطان `x < 2` و `x >= 2` يغطيان كل الاحتمالات الممكنة، فما ضل شي للـ `else`.

---

## 9. The try / except Structure (معالجة الأخطاء)

- **You surround a dangerous section of code with `try` and `except`**
- **If the code in the `try` works — the `except` is skipped**
- **If the code in the `try` fails — it jumps to the `except` section**

**بدون try — البرنامج يتوقف:**
```python
astr = 'Hello Bob'
istr = int(astr)          # ← البرنامج يتوقف هنا
print('First', istr)
astr = '123'
istr = int(astr)
print('Second', istr)
```
```
Traceback (most recent call last):
  File "notry.py", line 2, in <module>
    istr = int(astr)
ValueError: invalid literal for int() with base 10: 'Hello Bob'
```

**مع try — البرنامج يكمل:**
```python
astr = 'Hello Bob'
try:
    istr = int(astr)
except:
    istr = -1
print('First', istr)

astr = '123'
try:
    istr = int(astr)
except:
    istr = -1
print('Second', istr)
```
**Output:**
```
First -1
Second 123
```

> 💡 **توضيح بالعربي:**
> - التحويل الأول فشل → قفز مباشرة لـ `except` وحط `-1`، والبرنامج **كمّل عادي**.
> - التحويل الثاني نجح → **تخطّى** `except` كلياً.
> الفكرة: `try/except` هي **شبكة أمان (safety net)** تمنع توقّف البرنامج.

**نقطة دقيقة جداً:**
```python
astr = 'Bob'
try:
    print('Hello')
    istr = int(astr)
    print('There')      # ← لن تُطبع أبداً
except:
    istr = -1
print('Done', istr)
```
**Output:**
```
Hello
Done -1
```

> 🚨 **خطأ شائع:**
> عند حدوث الخطأ، **باقي أسطر الـ try تُهمَل بالكامل** ولا تُنفَّذ. القفز فوري للـ `except`. كثير طلاب بيتوقعوا طباعة `'There'` — **غلط**.

**مثال كامل:**
```python
rawstr = input('Enter a number:')
try:
    ival = int(rawstr)
except:
    ival = -1

if ival > 0 :
    print('Nice work')
else:
    print('Not a number')
```
```
Enter a number:42
Nice work

Enter a number:forty-two
Not a number
```

> ⚠️ **انتبه للامتحان:**
> - كلمة `try` هي الـ keyword المستخدمة لمعالجة الأخطاء ومنع انهيار البرنامج.
> - `except` ما بتنفّذ إلا **عند حصول خطأ فعلي**.
> - لا يمكن كتابة `try` بدون `except` — تعطي SyntaxError.
> - القيمة `-1` بهاي الأمثلة هي مجرد **قيمة حارسة (sentinel)** يختارها المبرمج للدلالة على "فشل التحويل" — مش قاعدة بلغة Python.

---

## 10. Exercises من السلايدات

### Exercise 1
اكتب برنامجاً يطلب من الطالب إدخال علامة، إذا كانت أعلى من 50 يطبع `"pass"`، ويطبع دائماً `"welcome to Al-Zaytoonah University"`:

```python
mark = int(input("Enter your mark: "))
if mark > 50:
    print("Pass")
print("Welcome to Al-Zaytoonah University")
```
> 💡 كلمة **"always"** بالسؤال معناها أن سطر الترحيب لازم يكون **خارج** الـ if (بدون إزاحة). هون بتنحسب العلامة.

### Exercise 2
صمّم flowchart ونفّذ برنامجاً يطلب نوع البيتزا: إذا اختار `"pepperoni"` يطبع السعر 2.00 JD، وإلا إذا اختار `"vegetarian"` يطبع 3.00 JD. ويطبع دائماً `"PIZZA"`:

```python
pizza = input("Enter pizza type: ")
if pizza == "pepperoni":
    print("the price is 2.00 JD")
elif pizza == "vegetarian":
    print("the price is 3.00 JD")
print("PIZZA")
```
> 💡 عبارة **"otherwise if"** بالسؤال تُترجم إلى `elif` وليس `else`. ولاحظ المقارنة بين نصوص باستخدام `==` عادي.

### Exercise 3
برنامج يطلب درجة الحرارة، يستخدم try/except، وإذا فشل التحويل يعطي `temp` القيمة `-1`، ثم إذا كانت أكبر من 30 يطبع `"It is sunny"`:

```python
temp = -1   # Default value if conversion fails

try:
    temp = int(input("Enter the temperature: "))
except:
    temp = -1

if temp > 30:
    print("It is sunny")
```
> 💡 **السؤال الذكي بالسلايد:** ما قيمة `temp` لو أدخل المستخدم `"thirty"`؟
> **الجواب: `-1`** — لأن `int("thirty")` بترمي ValueError فيقفز للـ except. وبالتالي `-1 > 30` خطأ ولا يُطبع شيء إطلاقاً.

---

## 11. جداول Code / Output من السلايدات (للتتبّع)

| Code | Output |
|---|---|
| `x = 10`<br>`if x > 5:`<br>`    print("Greater than 5")`<br>`if x < 20:`<br>`    print("Less than 20")`<br>`print("Done")` | `Greater than 5`<br>`Less than 20`<br>`Done` |
| `x = 5`<br>`print("Before if")`<br>`if x == 5:`<br>`    print("Inside if block")`<br>`print("After if")` | `Before if`<br>`Inside if block`<br>`After if` |
| `x = 15`<br>`if x > 10:`<br>`    print("More than 10")`<br>`    if x < 20:`<br>`        print("Less than 20")`<br>`print("All done")` | `More than 10`<br>`Less than 20`<br>`All done` |
| `x = 25`<br>`if x < 10:`<br>`    print("Small")`<br>`elif x < 20:`<br>`    print("Medium")`<br>`else:`<br>`    print("Large")` | `Large` |
| `x = 10`<br>`y = 3`<br>`if x // y > 2:`<br>`    print("Result is greater than 2")`<br>`else:`<br>`    print("Result is 2 or less")` | `Result is greater than 2` |

> 💡 المثال الأخير يربط الشابترين: `10 // 3` = **3** (قسمة صحيحة)، و `3 > 2` صحيح.

---

## 12. Summary من السلايد الأخير

Comparison operators `== <= >= > < !=` · Indentation · One-way Decisions · Two-way decisions (`if:` and `else:`) · Nested Decisions · Multi-way decisions using `elif` · `try / except` to compensate for errors

---

## 📋 Cheat Sheet — الخلاصة النهائية

### عوامل المقارنة
| العامل | المعنى | ملاحظة |
|---|---|---|
| `==` | يساوي | ليست `=` |
| `!=` | لا يساوي | `<>` **غير صالحة بـ Python 3** |
| `<` `>` | أصغر / أكبر | — |
| `<=` `>=` | أصغر أو يساوي / أكبر أو يساوي | ليست `=<` أو `=>` |

### أنواع القرارات
| النوع | البنية | عدد المخارج |
|---|---|---|
| One-way | `if` فقط | 0 أو 1 |
| Two-way | `if` + `else` | 1 بالضبط |
| Multi-way | `if` + `elif` + `else` | 1 بالضبط (مع else) |
| Nested | `if` داخل `if` | حسب التداخل |
| Sequential | عدة `if` منفصلة | 0 إلى n |

### قواعد البنية
| القاعدة | التفصيل |
|---|---|
| النقطتان `:` | إجبارية بعد `if` / `elif` / `else` / `try` / `except` |
| الإزاحة | إجبارية بعد `:` — عادة 4 مسافات |
| `else` | بدون شرط، ودائماً الأخيرة |
| `elif` | تُكتب مرات غير محدودة |
| نهاية الكتلة | رجوع الإزاحة لمستوى أقل |

### جدول الأخطاء
| الحالة | الخطأ |
|---|---|
| نسيان `:` بعد if | **SyntaxError** |
| عدم الإزاحة بعد `:` | **IndentationError** |
| `if x = 5:` | **SyntaxError** (استخدم `==`) |
| `else` بدون `if` | **SyntaxError** |
| `int('abc')` | **ValueError** ← يُعالَج بـ try/except |
| `'text' + 5` | **TypeError** |

### القاعدة الذهبية للـ elif
> أول شرط صحيح **يفوز ويوقف السلسلة**. رتّب من **الأضيق للأوسع**، وإلا صارت فروع لا تُنفَّذ أبداً (unreachable).
