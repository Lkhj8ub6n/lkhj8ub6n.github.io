# Chapter 2 — Variables, Expressions, and Statements
### Python for Everybody — ملف الدراسة الشامل (إنجليزي + شرح عربي + تلميحات امتحان)

---

## 1. Constants (الثوابت)

**Fixed values such as numbers, letters, and strings are called "constants" because their value does not change.**

- Numeric constants are as you expect.
- String constants use single quotes `'` or double quotes `"`.

```python
>>> print(123)
123
>>> print(98.6)
98.6
>>> print('Hello world')
Hello world
```

> 💡 **توضيح بالعربي:**
> الـ constant هي قيمة مكتوبة بشكل مباشر بالكود وما بتتغير. `123` رقم صحيح، `98.6` رقم عشري، و `'Hello world'` نص. النص لازم يكون بين علامتي اقتباس — سواء مفردة أو مزدوجة، الاثنتان صحيحتان بنفس الدرجة بـ Python.

> ⚠️ **انتبه للامتحان:**
> سؤال متكرر: "أي مما يلي **ليس** numeric constant؟" الجواب دايماً الخيار اللي بين علامتي اقتباس مثل `'Hello'` — لأنه string وليس رقم، حتى لو كان محتواه أرقام مثل `'123'`.

---

## 2. Reserved Words (الكلمات المحجوزة)

**You cannot use reserved words as variable names / identifiers.**

```
False      await      else       import     pass
None       break      except     in         raise
True       class      finally    is         return
and        continue   for        lambda     try
as         def        from       nonlocal   while
assert     del        global     not        with
async      elif       if         or         yield
```

> 💡 **توضيح بالعربي:**
> هاي كلمات محجوزة للغة نفسها، لها معنى خاص عند الـ interpreter، فما بتقدر تستخدمها كأسماء متغيرات. مثلاً `class = 5` بتعطي SyntaxError.

> ⚠️ **انتبه للامتحان:**
> السؤال بيجي معكوس: "أي مما يلي **ليس** reserved word؟" والجواب بيكون كلمة تبدو برمجية بس مش موجودة بالقائمة — مثل `variable`, `value`, `string`, `integer`, `print`.
> ملاحظة مهمة: `print` و `input` و `int` و `type` هي **functions مبنية (built-in)** وليست reserved words — بتقدر نظرياً تكتب `print = 5` وما بيعطي خطأ نحوي (لكن بتخرب الدالة).

---

## 3. Variables (المتغيرات)

**A variable is a named place in the memory where a programmer can store data and later retrieve the data using the variable "name".**

- Programmers get to choose the names of the variables.
- You can change the contents of a variable in a later statement.

```python
x = 12.2
y = 14
x = 100        # القيمة القديمة 12.2 راحت للأبد
```

> 💡 **توضيح بالعربي:**
> تخيّل الـ variable صندوق بالذاكرة له اسم. لما تكتب `x = 100` بتمسح اللي كان جوّاه وتحط القيمة الجديدة. Python بتحتفظ بآخر قيمة بس.

### Python Variable Name Rules (قواعد التسمية)

- **Must start with a letter or underscore `_`**
- **Must consist of letters, numbers, and underscores**
- **Case Sensitive**

| | أمثلة |
|---|---|
| **Good** | `spam`, `eggs`, `spam23`, `_speed` |
| **Bad** | `23spam`, `#sign`, `var.12` |
| **Different** | `spam`, `Spam`, `SPAM` (ثلاثة متغيرات مختلفة!) |

> 💡 **توضيح بالعربي:**
> - ما بيبدأ برقم أبداً → `23spam` خطأ.
> - النقطة `.` ممنوعة لأنها عامل الوصول للخصائص (attribute access) بـ Python → `var.12` خطأ.
> - `#` ممنوعة لأنها بتبدأ تعليق → `#sign` خطأ.
> - `_speed` صحيحة لأن الـ underscore مسموحة بالبداية.

> 🚨 **خطأ شائع:**
> الطالب بيختار `_speed` كخيار خاطئ لأنها "بتبدو غريبة" — لكنها **صحيحة 100%**. الـ underscore حرف مسموح في البداية وفي الوسط.

> ⚠️ **انتبه للامتحان:**
> Case Sensitive يعني `Spam` و `spam` متغيران مختلفان تماماً. لو الكود عرّف `Hours` واستخدم `hours` → **NameError**.

---

## 4. Mnemonic Variable Names (الأسماء الدلالية)

**We name variables to help us remember what we intend to store in them ("mnemonic" = "memory aid").**

```python
# غير واضح إطلاقاً
x1q3z9ocd = 35.0
x1q3z9afd = 12.50
x1q3p9afd = x1q3z9ocd * x1q3z9afd

# أوضح شوي
a = 35.0
b = 12.50
c = a * b

# الأفضل
hours = 35.0
rate = 12.50
pay = hours * rate
print(pay)
```

**Output:** `437.5`

> 💡 **توضيح بالعربي:**
> الثلاث نسخ تعمل **نفس الشيء بالضبط** من ناحية الـ interpreter — الفرق فقط للقارئ البشري. Python ما بتفهم معنى كلمة `hours`، هي مجرد اسم.

> ⚠️ **انتبه للامتحان:**
> سؤال شائع: "ماذا يفعل هذا الكود؟" والجواب: **يطبع حاصل ضرب المتغيرين** — بغض النظر عن غرابة الأسماء. لا تنخدع بأسماء المتغيرات، تتبّع العمليات فقط.

---

## 5. Sentences or Lines (أنواع الجمل البرمجية)

```python
x = 2          # Assignment statement
x = x + 2      # Assignment with expression
print(x)       # Print statement
```

**Output:** `4`

**Elements:** Variable — Operator — Constant — Function

> 💡 **توضيح بالعربي:**
> `x = x + 2` ليست معادلة رياضية! هي أمر تنفيذي: **احسب الطرف الأيمن أولاً** (`2 + 2 = 4`) ثم خزّن النتيجة في `x`. رياضياً هاي المعادلة مستحيلة، برمجياً هي عادية جداً.

### Assignment Statements

**An assignment statement consists of an expression on the right-hand side and a variable to store the result.**

```python
x = 0.6
x = 3.9 * x * ( 1 - x )
print(x)
```

**Output:** `0.9360000000000002`

> 💡 **توضيح بالعربي:**
> ترتيب التنفيذ: `x` القديمة (0.6) بتنحط بكل مكان بالطرف الأيمن → `3.9 * 0.6 * (1 - 0.6)` = `3.9 * 0.6 * 0.4` = `0.936` → بعدين النتيجة بتنحط بـ `x`، والقيمة القديمة بتنمسح.

> ⚠️ **انتبه للامتحان:**
> الـ `=` **ليست** علامة مساواة، هي **assignment** (إسناد). علامة المساواة بالمقارنة هي `==` (رح تجي بشابتر 3).

---

## 6. Numeric Expressions (العمليات الحسابية)

**Because of the lack of mathematical symbols on computer keyboards, we use "computer-speak" to express the classic math operations.**

| Operator | Operation |
|---|---|
| `+` | Addition |
| `-` | Subtraction |
| `*` | Multiplication |
| `/` | Division |
| `//` | Integer Division |
| `**` | Power |
| `%` | Remainder |

```python
>>> xx = 2
>>> xx = xx + 2
>>> print(xx)
4
>>> yy = 440 * 12
>>> print(yy)
5280
>>> zz = yy / 1000
>>> print(zz)
5.28
>>> rr = yy // 1000
>>> print(rr)
5
>>> jj = 23
>>> kk = jj % 5
>>> print(kk)
3
>>> print(4 ** 3)
64
```

> 💡 **توضيح بالعربي:**
> - `*` للضرب (وليس `x`).
> - `**` للأس — `4 ** 3` يعني 4 أُس 3 = 64. **ليست** `^`!
> - `//` قسمة صحيحة: بتاخد **الجزء الصحيح فقط** وبتتجاهل الكسر (floor).
> - `%` الباقي (remainder): `23 % 5` → 23 ÷ 5 = 4 والباقي **3**.

> 🚨 **خطأ شائع:**
> `4 ** 3` كثير من الطلاب بيختاروا `12` (ضرب) أو `43` (لصق). الجواب **64**.
> وكمان: بـ Python العلامة `^` **ليست** أُس — هي XOR (عملية bitwise)، فـ `4 ^ 3` بتعطي `7` وليس 64.

### تفصيل مهم: `%` مع الأرقام
```python
print(10 % 3)   # 1
print(10 % 5)   # 0
print(3 % 10)   # 3   ← الأصغر % الأكبر = الأصغر نفسه
print(7 % 2)    # 1   ← فردي دائماً يعطي 1
print(8 % 2)    # 0   ← زوجي دائماً يعطي 0
```

> ⚠️ **انتبه للامتحان:**
> `x % 2 == 0` هي الطريقة القياسية لفحص إذا الرقم زوجي. و `3 % 10` بتساوي `3` (لأن 3 ÷ 10 = صفر والباقي 3) — كثير طلاب بيغلطوا فيها.

---

## 7. Order of Evaluation — Operator Precedence (أولوية العمليات)

**Highest precedence rule to lowest precedence rule:**

1. **Parentheses** are always respected
2. **Exponentiation** (raise to a power)
3. **Multiplication, Division, and Remainder**
4. **Addition and Subtraction**
5. **Left to right**

مثال مفصّل من السلايدات:

```python
>>> x = 1 + 2 ** 3 / 4 * 5
>>> print(x)
11.0
```

**التتبّع خطوة بخطوة:**
```
1 + 2 ** 3 / 4 * 5     ← الأس أولاً
1 + 8 / 4 * 5          ← القسمة والضرب من اليسار لليمين
1 + 2.0 * 5
1 + 10.0               ← الجمع أخيراً
11.0
```

> 💡 **توضيح بالعربي:**
> احفظها بالترتيب: **قوس → أُس → (ضرب وقسمة وباقي) → (جمع وطرح) → من اليسار لليمين**.
> النقطة المهمة: الضرب والقسمة **بنفس المستوى** — يعني ما في "الضرب قبل القسمة"، بل الأسبق من جهة اليسار هو اللي بينفّذ أولاً.

> 🚨 **خطأ شائع جداً:**
> بمثال `8 / 4 * 5` الطالب بيحسب `4 * 5 = 20` أولاً ثم `8 / 20 = 0.4`. **غلط.** الصحيح: `8 / 4 = 2.0` أولاً ثم `2.0 * 5 = 10.0` — لأن الاتجاه من اليسار لليمين.

> ⚠️ **انتبه للامتحان:**
> لاحظ أن الناتج `11.0` وليس `11` — لأن وجود `/` بأي مكان بالتعبير بيحوّل النتيجة لـ **float**.

**استثناء مهم في `**`:**
```python
print(2 ** 3 ** 2)    # 512  وليس 64
```
> 💡 عامل الأُس وحده يُقيَّم **من اليمين لليسار**: `3 ** 2 = 9` ثم `2 ** 9 = 512`.

---

## 8. What Does "Type" Mean? (الأنواع)

**In Python variables, literals, and constants have a "type". Python knows the difference between an integer number and a string.**

**For example `+` means "addition" if something is a number and "concatenate" if something is a string.**

```python
>>> ddd = 1 + 4
>>> print(ddd)
5
>>> eee = 'hello ' + 'there'
>>> print(eee)
hello there
```

> 💡 **توضيح بالعربي:**
> نفس العلامة `+` لها معنيان حسب نوع الطرفين: مع الأرقام = جمع حسابي، ومع النصوص = **concatenate** (لصق/دمج). لاحظ المسافة في `'hello '` هي اللي فصلت الكلمتين — ما في مسافة تلقائية عند اللصق.

### Type Matters

```python
>>> eee = 'hello there'
>>> eee = eee + 1
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: can only concatenate str (not "int") to str
>>> type(eee)
<class 'str'>
>>> type('hello')
<class 'str'>
>>> type(1)
<class 'int'>
```

> 🚨 **خطأ شائع:**
> `'hello' + 1` → **TypeError**. Python ما بتحوّل تلقائياً بين string و int. (بلغات ثانية مثل JavaScript بتحوّل، بس Python **لأ**).

> ⚠️ **انتبه للامتحان:**
> احفظ الفرق بين نوعي الخطأ — بيجي كسؤال MCQ:
> - `'hello' + 1` → **TypeError** (نوعان غير متوافقان في عملية)
> - `int('hello')` → **ValueError** (النوع صحيح لكن القيمة غير قابلة للتحويل)

### Several Types of Numbers

- **Integers** are whole numbers: `-14, -2, 0, 1, 100, 401233`
- **Floating Point Numbers** have decimal parts: `-2.5, 0.0, 98.6, 14.0`

```python
>>> type(1)
<class 'int'>
>>> type(1.0)
<class 'float'>
>>> type(98.6)
<class 'float'>
```

> ⚠️ **انتبه للامتحان:**
> `1.0` نوعها **float** رغم إنها تساوي 1 رياضياً. وجود النقطة العشرية وحده يكفي لتكون float.

---

## 9. Type Conversions (تحويل الأنواع)

**When you put an integer and floating point in an expression, the integer is implicitly converted to a float. You can control this with the built-in functions `int()` and `float()`.**

```python
>>> print(float(99) + 100)
199.0

>>> i = 42
>>> type(i)
<class 'int'>
>>> f = float(i)
>>> print(f)
42.0
>>> type(f)
<class 'float'>

>>> x = 4.7
>>> print(int(x))
4
```

> 💡 **توضيح بالعربي:**
> - **Implicit conversion:** لو خلطت int مع float بأي عملية، Python بترقّي (promote) الـ int لـ float تلقائياً والنتيجة **float**.
> - **Explicit conversion:** إنت بتفرضها بنفسك عبر `int()` و `float()`.

> 🚨 **خطأ شائع خطير:**
> `int(4.7)` بتعطي **4** وليس 5! الدالة `int()` **بتقصّ (truncate)** الجزء العشري وما **بتقرّب (round)**.
> وللأرقام السالبة: `int(-4.7)` → **-4** (بتقصّ باتجاه الصفر).

---

## 10. Integer Division (القسمة)

**Integer division produces a floating point result.**

```python
>>> print(10 / 2)
5.0
>>> print(9 / 2)
4.5
>>> print(99 / 100)
0.99
>>> print(10.0 / 2.0)
5.0
>>> print(99.0 / 100.0)
0.99
```

> 💡 **توضيح بالعربي:**
> بـ Python 3 عامل القسمة `/` بيعطي **دائماً float** حتى لو القسمة كاملة بدون باقي. `10 / 2` نتيجتها `5.0` وليس `5`.

> 🚨 **خطأ شائع — أكثر سؤال Output بيوقّع الطلاب:**
> | التعبير | النتيجة | النوع |
> |---|---|---|
> | `10 / 2` | `5.0` | float |
> | `10 // 2` | `5` | int |
> | `9 / 2` | `4.5` | float |
> | `9 // 2` | `4` | int |
> | `9.0 // 2` | `4.0` | float ← انتبه! |
>
> القاعدة: `//` بترجع int **فقط** إذا الطرفان int. لو أحدهما float، النتيجة float لكن بدون كسر.

---

## 11. String Conversions (تحويل النصوص)

**You can also use `int()` and `float()` to convert between strings and integers. You will get an error if the string does not contain numeric characters.**

```python
>>> sval = '123'
>>> type(sval)
<class 'str'>
>>> print(sval + 1)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: can only concatenate str (not "int") to str

>>> ival = int(sval)
>>> type(ival)
<class 'int'>
>>> print(ival + 1)
124

>>> nsv = 'hello bob'
>>> niv = int(nsv)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
ValueError: invalid literal for int() with base 10: 'hello bob'
```

> 💡 **توضيح بالعربي:**
> `'123'` نص وليس رقم رغم شكله. لازم تحوّله بـ `int()` قبل أي عملية حسابية.

> ⚠️ **انتبه للامتحان:**
> `int('3.5')` بتعطي **ValueError** أيضاً! `int()` ما بتقبل نص فيه نقطة عشرية مباشرة. الحل: `int(float('3.5'))` → `3`.

---

## 12. User Input (إدخال المستخدم)

**We can instruct Python to pause and read data from the user using the `input()` function. The `input()` function returns a string.**

```python
nam = input('Who are you? ')
print('Welcome', nam)
```
```
Who are you? Chuck
Welcome Chuck
```

### Converting User Input

**If we want to read a number from the user, we must convert it from a string to a number using a type conversion function.**

```python
euf = input('Europe floor? ')
usf = int(euf) + 1
print('US floor', usf)
```
```
Europe floor? 0
US floor 1
```

> 💡 **توضيح بالعربي:**
> ملاحظة من السلايد: بعض الدول ترقّم الطوابق ابتداءً من 1، ودول أخرى تبدأ من الصفر (GF = Ground Floor).
> الأهم: `input()` بترجع **string دائماً وبلا استثناء** — حتى لو المستخدم كتب `5`، اللي بيوصلك هو `'5'` نص.

> 🚨 **خطأ شائع — سؤال Bug متكرر:**
> ```python
> x = input('Enter a number: ')
> print(x + 10)      # TypeError!
> ```
> **الصحيح:** `x = int(input('Enter a number: '))`

> ⚠️ **انتبه للامتحان:**
> - `print('Welcome', nam)` — الفاصلة بتضيف **مسافة تلقائياً** بين القيمتين.
> - `print('Welcome' + nam)` — اللصق **بدون مسافة**، ولازم يكون `nam` نص وإلا TypeError.

---

## 13. Comments in Python (التعليقات)

**Anything after a `#` is ignored by Python.**

**Why comment?**
- Describe what is going to happen in a sequence of code
- Document who wrote the code or other ancillary information
- Turn off a line of code — perhaps temporarily

```python
# Get the name of the file and open it
name = input('Enter file: ')
handle = open(name, 'r')

# print(name)   ← معطّل مؤقتاً
```

> 💡 **توضيح بالعربي:**
> علامة `#` بتلغي كل شي بعدها **على نفس السطر فقط**. Python ما فيها تعليق متعدد الأسطر رسمي مثل `/* */`.

> ⚠️ **انتبه للامتحان:**
> رمز التعليق بـ Python هو `#` — وليس `//` (تلك C/Java) ولا `/* */` ولا `--` (تلك SQL).
> وكمان: `#` **جوّا** نص ما بتعمل تعليق: `print('# not a comment')` بتطبع `# not a comment` عادي.

---

## 14. Exercises من السلايدات

### Exercise 1
حوّل المعادلة الرياضية لكود Python بحيث تكون النتيجة **integer**:
```python
Y = (a * x**2 + b * x + c) // (d - e * x)
```
> 💡 لاحظ استخدام `//` وليس `/` — لأن المطلوب نتيجة عدد صحيح. وهاي النقطة اللي بتنقّط عليها العلامة.

### Exercise 2
اكتب برنامجاً يطلب من المستخدم ساعات العمل وأجرة الساعة ويحسب الأجر الإجمالي:
```python
hours = float(input('Enter Hours: '))
rate = float(input('Enter Rate: '))
pay = hours * rate
print('Pay:', pay)
```
```
Enter Hours: 35
Enter Rate: 2.75
Pay: 96.25
```
> 💡 استخدمنا `float()` وليس `int()` لأن الأجرة `2.75` فيها كسر — لو استخدمت `int()` بتعطي **ValueError**.

---

## 15. Summary من السلايد الأخير

Type · Reserved words · Variables (mnemonic) · Operators · Operator precedence · Integer Division · Conversion between types · User input · Comments (`#`)

---

## 📋 Cheat Sheet — الخلاصة النهائية

### جدول العمليات
| Operator | Operation | مثال | النتيجة | النوع |
|---|---|---|---|---|
| `+` | Addition / Concatenate | `2 + 3` / `'a' + 'b'` | `5` / `'ab'` | int / str |
| `-` | Subtraction | `5 - 2` | `3` | int |
| `*` | Multiplication | `4 * 3` | `12` | int |
| `/` | Division | `9 / 2` | `4.5` | **float دائماً** |
| `//` | Integer Division | `9 // 2` | `4` | int |
| `**` | Power | `4 ** 3` | `64` | int |
| `%` | Remainder | `23 % 5` | `3` | int |

### أولوية العمليات
| الترتيب | العملية |
|---|---|
| 1 | `( )` Parentheses |
| 2 | `**` Power (يمين ← يسار) |
| 3 | `* / // %` |
| 4 | `+ -` |
| 5 | Left to Right |

### الأنواع والتحويل
| الدالة | الوظيفة | مثال | النتيجة |
|---|---|---|---|
| `type(x)` | يرجع نوع القيمة | `type(1.0)` | `<class 'float'>` |
| `int(x)` | تحويل لعدد صحيح (**يقصّ**) | `int(4.7)` | `4` |
| `float(x)` | تحويل لعدد عشري | `float(42)` | `42.0` |
| `str(x)` | تحويل لنص | `str(5)` | `'5'` |
| `input(p)` | قراءة من المستخدم | — | **str دائماً** |

### جدول الأخطاء
| الكود | الخطأ | السبب |
|---|---|---|
| `'hello' + 1` | **TypeError** | لصق نص مع رقم |
| `int('hello')` | **ValueError** | النص ليس رقماً |
| `int('3.5')` | **ValueError** | `int()` لا تقبل نقطة عشرية بالنص |
| `23spam = 5` | **SyntaxError** | اسم يبدأ برقم |
| `class = 5` | **SyntaxError** | reserved word |
| `print(hours)` بدون تعريف | **NameError** | متغير غير موجود |

### قواعد التسمية
| القاعدة | صح | غلط |
|---|---|---|
| يبدأ بحرف أو `_` | `_speed`, `spam` | `23spam` |
| حروف وأرقام و `_` فقط | `spam23` | `var.12`, `#sign` |
| Case Sensitive | `spam` ≠ `Spam` ≠ `SPAM` | — |
