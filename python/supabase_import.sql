-- ============================================================
-- إنشاء جدول أسئلة بايثون وإدخال كل الأسئلة دفعة واحدة
-- الصق هذا الملف كاملاً في: Supabase → SQL Editor → Run
-- ============================================================

create table if not exists public.python_questions (
    id             integer primary key,
    section        text,
    subsection     text,
    question       text,
    option_a       text,
    option_b       text,
    option_c       text,
    option_d       text,
    correct_option text,
    correct_text   text
);

alter table public.python_questions enable row level security;
drop policy if exists "python_questions public read" on public.python_questions;
create policy "python_questions public read"
    on public.python_questions for select to anon using (true);

create table if not exists public.app_config (
    key text primary key,
    enabled boolean not null default true
);
alter table public.app_config enable row level security;
drop policy if exists "app_config public read" on public.app_config;
create policy "app_config public read"
    on public.app_config for select to anon using (true);
insert into public.app_config (key, enabled) values ('python', true)
    on conflict (key) do nothing;

delete from public.python_questions;

insert into public.python_questions
    (id, section, subsection, question, option_a, option_b, option_c, option_d, correct_option, correct_text)
values
(1, 'المتغيرات والتعبيرات والجُمل', 'أسئلة اختيار (MCQ)', 'Which of the following is NOT a valid numeric constant in Python?', '123', '98.6', '''Hello''', '3.14', 'c', '''Hello'' موضوعة بين علامتي اقتباس فهي string وليست numeric constant. أما 123 فهي int، و 98.6 و 3.14 فهما float.'),
(2, 'المتغيرات والتعبيرات والجُمل', 'أسئلة اختيار (MCQ)', 'Which of the following is NOT a reserved word in Python?', 'for', 'class', 'variable', 'return', 'c', 'كلمة variable ليست محجوزة ويمكن استخدامها كاسم متغير. أما for و class و return فهي reserved words لها معنى خاص باللغة ولا يمكن استخدامها كأسماء.'),
(3, 'المتغيرات والتعبيرات والجُمل', 'أسئلة اختيار (MCQ)', 'Which of the following is a reserved word that CANNOT be used as a variable name?', 'value', 'lambda', 'number', 'total', 'b', 'lambda كلمة محجوزة ضمن قائمة الـ reserved words. أما value و number و total فأسماء عادية مسموحة تماماً.'),
(4, 'المتغيرات والتعبيرات والجُمل', 'أسئلة اختيار (MCQ)', 'String constants in Python can be written using:', 'Single quotes only', 'Double quotes only', 'Either single or double quotes', 'Backticks', 'c', 'Python تقبل '' و " بنفس الدرجة لتعريف النصوص. الـ backtick ` غير مستخدم في Python 3 نهائياً.'),
(5, 'المتغيرات والتعبيرات والجُمل', 'أسئلة اختيار (MCQ)', 'Which of the following is a valid Python variable name?', '23spam', 'var.12', '_speed', '#sign', 'c', '_speed صحيحة لأن الـ underscore مسموحة في البداية. 23spam خاطئة لأن الاسم لا يبدأ برقم، var.12 خاطئة لأن النقطة عامل وصول للخصائص، و #sign خاطئة لأن # تبدأ تعليقاً.'),
(6, 'المتغيرات والتعبيرات والجُمل', 'أسئلة اختيار (MCQ)', 'Which statement about Python variable names is TRUE?', 'Names are case insensitive', 'Names may start with a digit', 'Names are case sensitive', 'Names may contain a dot', 'c', 'Python حساسة لحالة الأحرف فـ spam و Spam و SPAM ثلاثة متغيرات مختلفة. لا يجوز البدء برقم ولا استخدام النقطة داخل الاسم.'),
(7, 'المتغيرات والتعبيرات والجُمل', 'أسئلة اختيار (MCQ)', 'After running: spam = 1 then Spam = 2 then SPAM = 3, how many variables exist?', '1', '2', '3', 'SyntaxError', 'c', 'بسبب الـ case sensitivity كل اسم يُعتبر متغيراً منفصلاً، فالنتيجة ثلاثة متغيرات مستقلة بقيم 1 و 2 و 3.'),
(8, 'المتغيرات والتعبيرات والجُمل', 'أسئلة اختيار (MCQ)', 'Why is the name var.12 invalid in Python?', 'It is too short', 'The dot is the attribute access operator', 'It contains digits', 'Variable names must be uppercase', 'b', 'النقطة في Python لها معنى خاص وهو الوصول لأعضاء الكائنات، لذلك لا يمكن أن تكون جزءاً من اسم متغير. الأرقام مسموحة داخل الاسم وليست هي السبب.'),
(9, 'المتغيرات والتعبيرات والجُمل', 'أسئلة اختيار (MCQ)', 'What is the purpose of using mnemonic variable names?', 'They run faster', 'They use less memory', 'They help the programmer remember what is stored', 'They are required by Python', 'c', 'المصطلح mnemonic يعني معين للذاكرة، والفائدة إنسانية بحتة لقراءة الكود. الـ interpreter لا يفرّق إطلاقاً بين hours و x1q3z9ocd من ناحية الأداء أو الذاكرة.'),
(10, 'المتغيرات والتعبيرات والجُمل', 'أسئلة اختيار (MCQ)', 'Which operator is used for exponentiation in Python?', '^', '**', 'exp()', '//', 'b', 'العامل ** هو الأس في Python. أما ^ فهو عامل XOR الثنائي وليس أساً، و // هي القسمة الصحيحة.'),
(11, 'المتغيرات والتعبيرات والجُمل', 'أسئلة اختيار (MCQ)', 'What does the % operator do in Python?', 'Calculates percentage', 'Returns the remainder', 'Performs division', 'Rounds the number', 'b', 'العامل % يُرجع باقي القسمة، فمثلاً 23 % 5 تساوي 3. لا علاقة له بالنسبة المئوية إطلاقاً في السياق الحسابي.'),
(12, 'المتغيرات والتعبيرات والجُمل', 'أسئلة اختيار (MCQ)', 'Which operator performs integer (floor) division?', '/', '//', '%', '**', 'b', '// تُرجع الجزء الصحيح من القسمة متجاهلة الكسر. أما / فتُرجع نتيجة عشرية دائماً، و % تُرجع الباقي، و ** الأس.'),
(13, 'المتغيرات والتعبيرات والجُمل', 'أسئلة اختيار (MCQ)', 'In Python 3, what is the result type of the / operator?', 'Always int', 'Always float', 'int if both operands are int', 'str', 'b', 'في Python 3 عامل / يُرجع float دائماً حتى لو كانت القسمة كاملة، فـ 10 / 2 تساوي 5.0 وليس 5. الخيار C يصف سلوك // وليس /.'),
(14, 'المتغيرات والتعبيرات والجُمل', 'أسئلة اختيار (MCQ)', 'Which of the following expressions evaluates to an int?', '10 / 5', '10.0 // 5', '10 // 5', '10 / 2.0', 'c', '// بين عددين صحيحين تُرجع int فالنتيجة 2. الخيار A يُرجع 2.0 لأن / دائماً float، والخيار B يُرجع 2.0 لأن أحد الطرفين float، والخيار D يُرجع 5.0.'),
(15, 'المتغيرات والتعبيرات والجُمل', 'تتبّع المخرجات (Output)', 'What is the output of: print(4 ** 3)', '7', '64', '12', '43', 'b', 'العامل ** يعني الأس، فـ 4 أُس 3 يساوي 64. الخيار A ناتج جمع، والخيار C ناتج ضرب، والخيار D مجرد لصق الرقمين.'),
(16, 'المتغيرات والتعبيرات والجُمل', 'تتبّع المخرجات (Output)', 'What is the output of: print(9 / 2)', '4', '4.5', '5', '5.0', 'b', 'عامل / يُجري قسمة عادية ويُرجع float، و 9 مقسومة على 2 تساوي 4.5. الخيار A هو ناتج // وليس /.'),
(17, 'المتغيرات والتعبيرات والجُمل', 'تتبّع المخرجات (Output)', 'What is the output of: print(10 / 2)', '5', '5.0', '2.0', '0.2', 'b', 'رغم أن القسمة كاملة إلا أن / تُرجع float دائماً في Python 3، فالناتج 5.0 وليس 5. هذه من أكثر النقاط التي يخطئ فيها الطلاب.'),
(18, 'المتغيرات والتعبيرات والجُمل', 'تتبّع المخرجات (Output)', 'What is the output of: print(9 // 2)', '4.5', '4', '5', '4.0', 'b', '// تُرجع الجزء الصحيح فقط، و 9 على 2 تساوي 4.5 فيؤخذ 4. والنوع int لأن الطرفين int، لذلك ليس 4.0.'),
(19, 'المتغيرات والتعبيرات والجُمل', 'تتبّع المخرجات (Output)', 'What is the output of: print(9.0 // 2)', '4', '4.0', '4.5', '5.0', 'b', '// تقصّ الكسر فتعطي 4، لكن وجود float بين المعاملات يجعل النوع float فالناتج 4.0. القاعدة: // تُرجع int فقط إذا كان الطرفان int.'),
(20, 'المتغيرات والتعبيرات والجُمل', 'تتبّع المخرجات (Output)', 'What is the output of: print(23 % 5)', '4', '3', '4.6', '5', 'b', '23 على 5 تساوي 4 والباقي 3، والعامل % يُرجع الباقي وليس ناتج القسمة. الخيار A هو ناتج 23 // 5.'),
(21, 'المتغيرات والتعبيرات والجُمل', 'تتبّع المخرجات (Output)', 'What is the output of: print(3 % 10)', '0', '3', '0.3', '10', 'b', '3 على 10 يساوي صفر والباقي هو 3 نفسه. القاعدة: إذا كان المقسوم أصغر من المقسوم عليه فالباقي هو المقسوم نفسه.'),
(22, 'المتغيرات والتعبيرات والجُمل', 'تتبّع المخرجات (Output)', 'What is the output of: print(1 + 2 ** 3 / 4 * 5)', '11', '11.0', '3.75', '45.0', 'b', 'الأس أولاً فيصبح 1 + 8 / 4 * 5، ثم القسمة والضرب من اليسار لليمين: 8/4=2.0 ثم 2.0*5=10.0، ثم 1+10.0=11.0. النتيجة float بسبب وجود /.'),
(23, 'المتغيرات والتعبيرات والجُمل', 'تتبّع المخرجات (Output)', 'What is the output of: print(8 / 4 * 5)', '0.4', '10.0', '40', '1.6', 'b', 'القسمة والضرب لهما نفس الأولوية فيُنفَّذان من اليسار لليمين: 8/4=2.0 ثم 2.0*5=10.0. الخيار A هو خطأ من ينفّذ الضرب أولاً.'),
(24, 'المتغيرات والتعبيرات والجُمل', 'تتبّع المخرجات (Output)', 'What is the output of: print(2 ** 3 ** 2)', '64', '512', '12', '36', 'b', 'عامل الأس وحده يُقيَّم من اليمين لليسار، فيُحسب 3**2=9 أولاً ثم 2**9=512. الخيار A هو خطأ من يحسب من اليسار.'),
(25, 'المتغيرات والتعبيرات والجُمل', 'تتبّع المخرجات (Output)', 'What is the output of: print((1 + 2) * 3)', '7', '9', '6', '123', 'b', 'الأقواس لها الأولوية القصوى فيُحسب 1+2=3 أولاً ثم 3*3=9. بدون الأقواس كان الناتج 7 بسبب أسبقية الضرب.'),
(26, 'المتغيرات والتعبيرات والجُمل', 'تتبّع المخرجات (Output)', 'What is the output of:
xx = 2
xx = xx + 2
print(xx)', '2', '4', '22', 'Error', 'b', 'الطرف الأيمن يُحسب أولاً باستخدام القيمة القديمة: 2+2=4، ثم تُخزَّن النتيجة في xx. هذه جملة إسناد وليست معادلة رياضية.'),
(27, 'المتغيرات والتعبيرات والجُمل', 'تتبّع المخرجات (Output)', 'What is the output of:
a = 35.0
b = 12.50
c = a * b
print(c)', '35.0', '12.5', '437.5', 'Error', 'c', 'الكود يحسب حاصل ضرب المتغيرين: 35.0 × 12.50 = 437.5. أسماء المتغيرات لا تؤثر على النتيجة إطلاقاً.'),
(28, 'المتغيرات والتعبيرات والجُمل', 'أسئلة اختيار (MCQ)', 'What function can be used to check the type of a variable in Python?', 'typeof()', 'checktype()', 'type()', 'getType()', 'c', 'الدالة المبنية type() هي الصحيحة في Python. أما typeof فهو من JavaScript والخياران الآخران غير موجودين أصلاً.'),
(29, 'المتغيرات والتعبيرات والجُمل', 'تتبّع المخرجات (Output)', 'What is the output of: print(type(1.0))', '<class ''int''>', '<class ''float''>', '<class ''str''>', '1.0', 'b', 'وجود النقطة العشرية يجعل القيمة float حتى لو كانت تساوي 1 رياضياً. النوع يُحدَّد بالشكل المكتوب وليس بالقيمة.'),
(30, 'المتغيرات والتعبيرات والجُمل', 'تتبّع المخرجات (Output)', 'What is the output of: print(type(''123''))', '<class ''int''>', '<class ''float''>', '<class ''str''>', '<class ''number''>', 'c', 'وجود علامتي الاقتباس يجعلها string حتى لو كان محتواها أرقاماً. لتحويلها لعدد نحتاج int(''123'').'),
(31, 'المتغيرات والتعبيرات والجُمل', 'أسئلة اختيار (MCQ)', 'What will happen if you try to concatenate a string with an integer using + in Python?', 'The values will be automatically converted', 'Python will throw a TypeError', 'Python will ignore the integer', 'The integer will be treated as a string', 'b', 'Python لا تحوّل الأنواع تلقائياً في هذه الحالة وترمي TypeError. التحويل التلقائي موجود في لغات أخرى مثل JavaScript وليس في Python.'),
(32, 'المتغيرات والتعبيرات والجُمل', 'تتبّع المخرجات (Output)', 'What is the result of: int(4.7)', '5', '4', '4.7', 'Error', 'b', 'الدالة int() تقصّ الجزء العشري ولا تقرّب، فالناتج 4 وليس 5. للتقريب الحقيقي نستخدم round() وليس int().'),
(33, 'المتغيرات والتعبيرات والجُمل', 'تتبّع المخرجات (Output)', 'What is the result of: int(-4.7)', '-5', '-4', '-4.7', 'Error', 'b', 'int() تقصّ باتجاه الصفر فتحذف الكسر ويبقى -4. لو كانت تقرّب لأعطت -5.'),
(34, 'المتغيرات والتعبيرات والجُمل', 'تتبّع المخرجات (Output)', 'What is the output of: print(float(99) + 100)', '199', '199.0', '99100', 'Error', 'b', 'float(99) تعطي 99.0 وعند جمعها مع int يُرقّى الـ int إلى float فتكون النتيجة 199.0 وليس 199.'),
(35, 'المتغيرات والتعبيرات والجُمل', 'تتبّع المخرجات (Output)', 'What error does this produce?
nsv = ''hello bob''
niv = int(nsv)', 'TypeError', 'ValueError', 'NameError', 'SyntaxError', 'b', 'النوع المُمرَّر صحيح (نص) لكن القيمة نفسها غير قابلة للتحويل لرقم، وهذا تعريف الـ ValueError. الـ TypeError يحدث عند خلط أنواع في عملية مثل ''hello'' + 1.'),
(36, 'المتغيرات والتعبيرات والجُمل', 'أسئلة اختيار (MCQ)', 'What is the result of int(''3.5'') ?', '3', '3.5', '4', 'ValueError', 'd', 'الدالة int() لا تقبل نصاً يحتوي نقطة عشرية وترمي ValueError مباشرة. الحل الصحيح هو int(float(''3.5'')) فتعطي 3.'),
(37, 'المتغيرات والتعبيرات والجُمل', 'أسئلة اختيار (MCQ)', 'Which function is used to get user input in Python?', 'scan()', 'read()', 'input()', 'userInput()', 'c', 'الدالة input() هي المخصصة لقراءة مدخلات المستخدم في Python 3. باقي الخيارات إما غير موجودة أو من لغات أخرى.'),
(38, 'المتغيرات والتعبيرات والجُمل', 'أسئلة اختيار (MCQ)', 'What data type does the input() function always return?', 'int', 'float', 'str', 'It depends on what the user types', 'c', 'input() تُرجع string دائماً وبلا استثناء حتى لو أدخل المستخدم أرقاماً. لهذا نحتاج int() أو float() للتحويل قبل الحساب.'),
(39, 'المتغيرات والتعبيرات والجُمل', 'تتبّع المخرجات (Output)', 'What is the output if the user enters 5 ?
x = input(''Enter: '')
print(x + x)', '10', '55', '25', 'TypeError', 'b', 'بما أن x نص فإن + تعني concatenate فتلتصق ''5'' مع ''5'' وتعطي ''55''. لو أردنا 10 لوجب كتابة int(input(...)).'),
(40, 'المتغيرات والتعبيرات والجُمل', 'تتبّع المخرجات (Output)', 'What is the output if the user enters 0 ?
euf = input(''Europe floor? '')
usf = int(euf) + 1
print(''US floor'', usf)', 'US floor 0', 'US floor 1', 'US floor 01', 'TypeError', 'b', 'التحويل بـ int() يجعل القيمة رقماً فيصبح 0+1=1. والفاصلة في print تضيف مسافة تلقائياً بين النص والقيمة.'),
(41, 'المتغيرات والتعبيرات والجُمل', 'أسئلة اختيار (MCQ)', 'What symbol is used for comments in Python?', '//', '#', '/* */', '--', 'b', 'الرمز # يجعل Python تتجاهل كل ما بعده على نفس السطر. الرمز // تعليق في C وJava، و -- في SQL، وليست تعليقات في Python.'),
(42, 'المتغيرات والتعبيرات والجُمل', 'تتبّع المخرجات (Output)', 'What is the output of: print(''# not a comment'')', 'Nothing', '# not a comment', 'not a comment', 'SyntaxError', 'b', 'الرمز # داخل نص هو مجرد حرف عادي ولا يُعامَل كتعليق. التعليق يبدأ فقط عندما تكون # خارج علامتي الاقتباس.'),
(43, 'المتغيرات والتعبيرات والجُمل', 'تتبّع المخرجات (Output)', 'What is the output of:
x = 5   # x = 10
print(x)', '5', '10', '5 10', 'Error', 'a', 'كل ما بعد # يُتجاهَل تماماً، فالإسناد الثاني لم يحدث أبداً وبقيت قيمة x هي 5.'),
(44, 'المتغيرات والتعبيرات والجُمل', 'اكتشاف الأخطاء (Bug)', 'Find the bug:
x = input(''Enter a number: '')
print(x + 10)', 'input should be spelled Input', 'x is a string so + 10 raises TypeError', 'print needs a semicolon', 'There is no bug', 'b', 'input() تُرجع نصاً فتصبح العملية نص + عدد وهي TypeError. التصحيح: x = int(input(''Enter a number: '')) قبل الجمع.'),
(45, 'المتغيرات والتعبيرات والجُمل', 'اكتشاف الأخطاء (Bug)', 'Find the bug:
23spam = 5
print(23spam)', 'print cannot take a variable', 'Variable names cannot start with a digit', 'spam is a reserved word', 'There is no bug', 'b', 'أسماء المتغيرات يجب أن تبدأ بحرف أو underscore، فالبدء برقم يعطي SyntaxError. كلمة spam ليست محجوزة والمشكلة في الرقم فقط.'),
(46, 'المتغيرات والتعبيرات والجُمل', 'اكتشاف الأخطاء (Bug)', 'Find the bug:
hours = 35
print(Hours * 2)', 'Nothing is wrong', 'NameError because Hours is not defined', 'TypeError', 'Missing parentheses', 'b', 'Python حساسة لحالة الأحرف فـ Hours متغير مختلف تماماً عن hours ولم يُعرَّف، والنتيجة NameError.'),
(47, 'المتغيرات والتعبيرات والجُمل', 'اكتشاف الأخطاء (Bug)', 'Find the bug:
price = ''20''
total = price * 1.5
print(total)', 'Strings cannot be multiplied by float so TypeError', 'It prints 30.0', 'It prints 202020', 'SyntaxError', 'a', 'ضرب نص في float يعطي TypeError، رغم أن ضرب نص في int صحيح ويكرّر النص. الحل: تحويل price بـ int() أو float() أولاً.'),
(48, 'المتغيرات والتعبيرات والجُمل', 'اكتشاف الأخطاء (Bug)', 'A student wants an integer result for a division. Which line is correct?', 'y = a / b', 'y = a // b', 'y = a % b', 'y = a ** b', 'b', '// هي القسمة الصحيحة التي تعطي عدداً صحيحاً. أما / فتعطي float دائماً، و % تعطي الباقي، و ** الأس.'),
(49, 'المتغيرات والتعبيرات والجُمل', 'اكتشاف الأخطاء (Bug)', 'Find the bug:
hours = float(input(''Hours: ''))
rate = int(input(''Rate: ''))
pay = hours * rate
If the user enters rate 2.75, what happens?', 'It works and prints the pay', 'ValueError because int() rejects ''2.75''', 'The rate becomes 2', 'TypeError', 'b', 'الدالة int() لا تقبل نصاً يحوي نقطة عشرية وترمي ValueError. الحل استخدام float() للأجرة لأنها قد تحتوي كسراً.'),
(50, 'المتغيرات والتعبيرات والجُمل', 'أسئلة اختيار (MCQ)', 'What if you write 4 ^ 3 in Python instead of 4 ** 3 ?', 'It gives 64', 'It gives 7', 'It gives 12', 'SyntaxError', 'b', 'العامل ^ في Python هو XOR الثنائي وليس أساً، و 4 XOR 3 تساوي 7. للأس يجب استخدام ** حصراً.'),
(51, 'المتغيرات والتعبيرات والجُمل', 'تتبّع المخرجات (Output)', 'What is the output of: print(7 % 2, 8 % 2)', '1 0', '0 1', '3 4', '1 1', 'a', 'الرقم الفردي مقسوماً على 2 يعطي باقياً 1 والزوجي يعطي 0. لهذا تُستخدم x % 2 == 0 لفحص الزوجية.'),
(52, 'المتغيرات والتعبيرات والجُمل', 'تتبّع المخرجات (Output)', 'What is the output of: print(''hello '' + ''there'')', 'hello there', 'hellothere', 'hello + there', 'TypeError', 'a', 'العامل + بين نصين يعني concatenate، والمسافة الظاهرة جاءت من داخل النص الأول نفسه وليست تلقائية.'),
(53, 'المتغيرات والتعبيرات والجُمل', 'تتبّع المخرجات (Output)', 'What is the output of: print(''5'' * 3)', '15', '555', 'TypeError', '5 5 5', 'b', 'ضرب نص في عدد صحيح يكرّر النص ثلاث مرات فينتج ''555''. هذه حالة خاصة مسموحة بعكس ضرب النص في float.'),
(54, 'المتغيرات والتعبيرات والجُمل', 'أسئلة اختيار (MCQ)', 'In the expression 3 + 4.0, what happens to the integer 3?', 'It stays an int and the result is int', 'It is implicitly converted to float', 'It raises a TypeError', 'It is truncated', 'b', 'عند خلط int مع float يرقّي Python الـ int تلقائياً إلى float فتكون النتيجة 7.0 من نوع float.'),
(55, 'المتغيرات والتعبيرات والجُمل', 'تتبّع المخرجات (Output)', 'What is the output of:
x = 0.6
x = 3.9 * x * (1 - x)
print(round(x, 3))', '0.6', '0.936', '1.0', '2.34', 'b', 'يُحسب الطرف الأيمن أولاً بالقيمة القديمة: 3.9 × 0.6 × 0.4 = 0.936، ثم تُخزَّن في x فتُمسح القيمة القديمة.'),
(56, 'التنفيذ الشرطي', 'أسئلة اختيار (MCQ)', 'Which of the following is NOT a valid comparison operator in Python 3?', '==', '!=', '<>', '>=', 'c', 'العامل <> كان مستخدماً في Python 2 لكنه أُلغي نهائياً في Python 3، والبديل هو !=. باقي الخيارات صحيحة.'),
(57, 'التنفيذ الشرطي', 'أسئلة اختيار (MCQ)', 'The operator used to check if two values are equal in Python is:', '=', '==', '===', 'eq', 'b', 'العامل == للمقارنة بينما = للإسناد. العامل === غير موجود في Python وهو من JavaScript.'),
(58, 'التنفيذ الشرطي', 'أسئلة اختيار (MCQ)', 'What is the difference between = and == in Python?', 'No difference', '= assigns a value, == compares values', '= compares, == assigns', 'Both compare values', 'b', 'علامة = تُسند قيمة لمتغير، بينما == تقارن قيمتين وتُرجع True أو False. خلطهما داخل if يعطي SyntaxError.'),
(59, 'التنفيذ الشرطي', 'أسئلة اختيار (MCQ)', 'Which operator means ''not equal'' in Python?', '!=', '=/=', '<>', 'not=', 'a', 'العامل != هو الصحيح في Python 3. العامل <> قديم وملغى والخياران الآخران غير موجودين.'),
(60, 'التنفيذ الشرطي', 'أسئلة اختيار (MCQ)', 'A Boolean expression in Python evaluates to:', 'Yes or No', '1 or 0 only', 'True or False', 'On or Off', 'c', 'التعبير المنطقي يُرجع قيمة من نوع bool وهي True أو False بحرف كبير في البداية. رغم أن True تساوي 1 عددياً إلا أن النوع bool وليس int.'),
(61, 'التنفيذ الشرطي', 'أسئلة اختيار (MCQ)', 'Which of the following is written INCORRECTLY?', 'x <= 5', 'x >= 5', 'x =< 5', 'x != 5', 'c', 'الصيغة الصحيحة هي <= و >= بحيث تأتي علامة المساواة في النهاية. الصيغة =< تعطي SyntaxError.'),
(62, 'التنفيذ الشرطي', 'أسئلة اختيار (MCQ)', 'Do comparison operators change the value of the variables they compare?', 'Yes always', 'No they only produce True or False', 'Only with ==', 'Only inside if', 'b', 'عوامل المقارنة تقرأ القيم فقط وتنتج نتيجة منطقية دون تعديل أي متغير. التعديل يحدث بالإسناد = فقط.'),
(63, 'التنفيذ الشرطي', 'أسئلة اختيار (MCQ)', 'An if statement must end with a ________ before the indented block begins.', '; (semicolon)', ': (colon)', '. (dot)', '{ (brace)', 'b', 'النقطتان : إجبارية في نهاية سطر الـ if وإلا فـ SyntaxError. الأقواس المعقوفة تُستخدم في C وJava وليس Python.'),
(64, 'التنفيذ الشرطي', 'أسئلة اختيار (MCQ)', 'How does Python determine which lines belong to an if block?', 'By curly braces', 'By semicolons', 'By indentation', 'By the end keyword', 'c', 'Python تستخدم الإزاحة نفسها كجزء من قواعد اللغة لتحديد الكتل، بعكس C وJava اللتين تستخدمان { }.'),
(65, 'التنفيذ الشرطي', 'أسئلة اختيار (MCQ)', 'What ends an if block in Python?', 'A blank line', 'A comment line', 'Reducing the indentation', 'The keyword end', 'c', 'الكتلة تنتهي عند رجوع الإزاحة لمستوى أقل. الأسطر الفارغة والتعليقات المستقلة تُتجاهَل ولا تنهي الكتلة.'),
(66, 'التنفيذ الشرطي', 'أسئلة اختيار (MCQ)', 'In Python, blank lines inside a block:', 'End the block', 'Cause an IndentationError', 'Are ignored and do not affect indentation', 'Must be indented too', 'c', 'الأسطر الفارغة تُتجاهَل تماماً فيما يخص الإزاحة ولا تؤثر على حدود الكتلة إطلاقاً.'),
(67, 'التنفيذ الشرطي', 'أسئلة اختيار (MCQ)', 'The ________ keyword is used to handle errors in a program to prevent crashes.', 'catch', 'try', 'error', 'handle', 'b', 'في Python نستخدم try مع except لالتقاط الأخطاء. كلمة catch مستخدمة في Java وC# وليست في Python.'),
(68, 'التنفيذ الشرطي', 'أسئلة اختيار (MCQ)', 'The ________ statement is used when we want to test multiple conditions in sequence.', 'switch', 'elif', 'case', 'when', 'b', 'elif هي اختصار else if وتُستخدم للقرارات متعددة الاتجاهات. لا يوجد switch أو case في Python الأساسية.'),
(69, 'التنفيذ الشرطي', 'أسئلة اختيار (MCQ)', 'Which statement about else is TRUE?', 'else can have its own condition', 'else must come last and takes no condition', 'else can be used without if', 'You may write two else in one chain', 'b', 'else لا تأخذ شرطاً أبداً ويجب أن تكون الأخيرة في السلسلة وتتبع if. كتابتها وحدها تعطي SyntaxError.'),
(70, 'التنفيذ الشرطي', 'تتبّع المخرجات (Output)', 'What will be the output?
x = 5
if x < 10:
    print(''Smaller'')
if x > 20:
    print(''Bigger'')
print(''Finish'')', 'Smaller then Finish', 'Bigger then Finish', 'Smaller then Bigger then Finish', 'Finish only', 'a', 'الشرط الأول صحيح فطُبع Smaller، والثاني خاطئ فتُخطي. وسطر Finish خارج كل الكتل فيُنفَّذ دائماً.'),
(71, 'التنفيذ الشرطي', 'تتبّع المخرجات (Output)', 'What will be the output?
x = 5
print(''Before if'')
if x == 5:
    print(''Inside if block'')
print(''After if'')', 'Before if / After if', 'Before if / Inside if block / After if', 'Inside if block only', 'Nothing', 'b', 'الشرط صحيح فطُبعت الأسطر الثلاثة بالترتيب. السطران الأول والأخير خارج الكتلة فيُنفَّذان بغض النظر عن الشرط.'),
(72, 'التنفيذ الشرطي', 'تتبّع المخرجات (Output)', 'What will be the output?
x = 10
if x > 5:
    print(''Bigger than 5'')
    print(''Still bigger'')
print(''Done'')', 'Bigger than 5 / Done', 'Bigger than 5 / Still bigger / Done', 'Done only', 'Bigger than 5 only', 'b', 'الكتلة تحتوي سطرين مُزاحين فيُنفَّذان معاً عند تحقق الشرط، ثم يُنفَّذ Done لأنه خارج الكتلة.'),
(73, 'التنفيذ الشرطي', 'تتبّع المخرجات (Output)', 'What will be the output?
x = 5
print(''Before if 6'')
if x == 6:
    print(''Is 6'')
    print(''Still 6'')
print(''Afterwards if 6'')', 'Before if 6 / Afterwards if 6', 'Before if 6 / Is 6 / Afterwards if 6', 'Nothing', 'Afterwards if 6 only', 'a', 'بما أن الشرط خاطئ فقد تم تخطي الكتلة كاملة بسطريها. السطران غير المُزاحين طُبعا عادياً.'),
(74, 'التنفيذ الشرطي', 'تتبّع المخرجات (Output)', 'What will be the output?
x = 42
if x > 1:
    print(''More than one'')
    if x < 100:
        print(''Less than 100'')
print(''All done'')', 'More than one / All done', 'More than one / Less than 100 / All done', 'All done only', 'Less than 100 / All done', 'b', 'الشرط الخارجي صحيح فدخلنا الكتلة، والداخلي صحيح أيضاً فطُبع سطره. الـ if الداخلية تُفحص فقط عند تحقق الخارجية.'),
(75, 'التنفيذ الشرطي', 'تتبّع المخرجات (Output)', 'What will be the output?
x = 0
if x > 1:
    print(''More than one'')
    if x < 100:
        print(''Less than 100'')
print(''All done'')', 'More than one / All done', 'Less than 100 / All done', 'All done', 'Nothing', 'c', 'الشرط الخارجي خاطئ فتُخطَّت الكتلة كاملة بما فيها الـ if الداخلية دون فحصها. بقي فقط السطر الأخير غير المُزاح.'),
(76, 'التنفيذ الشرطي', 'تتبّع المخرجات (Output)', 'What will be the output?
x = 4
if x > 2:
    print(''Bigger'')
else:
    print(''Smaller'')
print(''All done'')', 'Bigger / All done', 'Smaller / All done', 'Bigger / Smaller / All done', 'All done', 'a', 'مع else يُنفَّذ فرع واحد بالضبط، وبما أن 4 > 2 صحيح فقد نُفِّذ فرع if وتُخطي else تماماً.'),
(77, 'التنفيذ الشرطي', 'تتبّع المخرجات (Output)', 'What will be the output?
x = 25
if x < 10:
    print(''Small'')
elif x < 20:
    print(''Medium'')
else:
    print(''Large'')', 'Small', 'Medium', 'Large', 'Nothing', 'c', 'الشرطان الأول والثاني خاطئان لأن 25 ليست أقل من 10 ولا من 20، فيُنفَّذ فرع else الافتراضي.'),
(78, 'التنفيذ الشرطي', 'تتبّع المخرجات (Output)', 'What will be the output?
x = 5
if x < 2:
    print(''small'')
elif x < 10:
    print(''Medium'')
else:
    print(''LARGE'')
print(''All done'')', 'small / All done', 'Medium / All done', 'LARGE / All done', 'Medium / LARGE / All done', 'b', 'الشرط الأول خاطئ والثاني صحيح فطُبع Medium وخرجت السلسلة فوراً دون فحص else.'),
(79, 'التنفيذ الشرطي', 'تتبّع المخرجات (Output)', 'What will be the output?
x = 10
y = 3
if x // y > 2:
    print(''Result is greater than 2'')
else:
    print(''Result is 2 or less'')', 'Result is greater than 2', 'Result is 2 or less', 'Both lines', 'TypeError', 'a', 'القسمة الصحيحة 10 // 3 تعطي 3، و 3 > 2 صحيح فيُنفَّذ فرع if. لو استُخدمت / لكانت النتيجة 3.33 والشرط أيضاً صحيح.'),
(80, 'التنفيذ الشرطي', 'تتبّع المخرجات (Output)', 'What will be the output?
x = 5
if x > 1:
    print(''A'')
elif x > 2:
    print(''B'')', 'A', 'B', 'A then B', 'Nothing', 'a', 'في سلسلة elif يوقف أول شرط صحيح البحث تماماً، فبعد طباعة A لم يُفحص الشرط الثاني إطلاقاً رغم أنه صحيح أيضاً.'),
(81, 'التنفيذ الشرطي', 'تتبّع المخرجات (Output)', 'What will be the output?
x = 5
if x > 1:
    print(''A'')
if x > 2:
    print(''B'')', 'A', 'B', 'A then B', 'Nothing', 'c', 'هنا if منفصلتان وليستا سلسلة، فكل واحدة تُفحص باستقلال وكلا الشرطين صحيح فطُبع السطران.'),
(82, 'التنفيذ الشرطي', 'تتبّع المخرجات (Output)', 'What will be the output?
x = 15
if x > 10:
    print(''More than 10'')
    if x < 20:
        print(''Less than 20'')
print(''All done'')', 'More than 10 / All done', 'More than 10 / Less than 20 / All done', 'All done', 'Less than 20', 'b', 'الشرطان المتداخلان صحيحان فطُبع السطران ثم السطر الأخير غير المُزاح.'),
(83, 'التنفيذ الشرطي', 'أسئلة اختيار (MCQ)', 'Which line will NEVER print?
if x < 2:
    print(''Below 2'')
elif x < 20:
    print(''Below 20'')
elif x < 10:
    print(''Below 10'')
else:
    print(''Something else'')', 'Below 2', 'Below 20', 'Below 10', 'Something else', 'c', 'أي قيمة أقل من 10 هي حتماً أقل من 20 فتُمسك بالشرط السابق، مما يجعل الفرع الثالث unreachable. القاعدة: رتّب الشروط من الأضيق للأوسع.'),
(84, 'التنفيذ الشرطي', 'أسئلة اختيار (MCQ)', 'Which line will NEVER print?
if x < 2:
    print(''Below 2'')
elif x >= 2:
    print(''Two or more'')
else:
    print(''Something else'')', 'Below 2', 'Two or more', 'Something else', 'All of them print', 'c', 'الشرطان يغطيان كل القيم الممكنة دون استثناء فلا يبقى أي احتمال يصل إلى else.'),
(85, 'التنفيذ الشرطي', 'أسئلة اختيار (MCQ)', 'In an elif chain, if two conditions are both True, which block runs?', 'Both blocks', 'The last True one', 'The first True one', 'Neither', 'c', 'أول شرط يتحقق من الأعلى للأسفل يُنفَّذ ثم تنتهي السلسلة كاملة، ولا تُفحص الشروط التالية إطلاقاً.'),
(86, 'التنفيذ الشرطي', 'أسئلة اختيار (MCQ)', 'What happens if no condition is True and there is no else?', 'SyntaxError', 'The last block runs', 'No block runs at all', 'The first block runs', 'c', 'بدون else قد لا يُنفَّذ أي فرع نهائياً ويكمل البرنامج بعد السلسلة. وجود else يضمن تنفيذ فرع واحد دائماً.'),
(87, 'التنفيذ الشرطي', 'تتبّع المخرجات (Output)', 'What will be the output?
astr = ''Hello Bob''
try:
    istr = int(astr)
except:
    istr = -1
print(''First'', istr)', 'First Hello Bob', 'First -1', 'ValueError', 'First 0', 'b', 'التحويل فشل فقفز التنفيذ إلى except وأُسندت القيمة -1، والبرنامج أكمل دون توقف بفضل شبكة الأمان.'),
(88, 'التنفيذ الشرطي', 'تتبّع المخرجات (Output)', 'What will be the output?
astr = ''123''
try:
    istr = int(astr)
except:
    istr = -1
print(''Second'', istr)', 'Second -1', 'Second 123', 'Second ''123''', 'ValueError', 'b', 'التحويل نجح فتم تخطي كتلة except كلياً وبقيت القيمة 123 كعدد صحيح.'),
(89, 'التنفيذ الشرطي', 'تتبّع المخرجات (Output)', 'What will be the output?
astr = ''Bob''
try:
    print(''Hello'')
    istr = int(astr)
    print(''There'')
except:
    istr = -1
print(''Done'', istr)', 'Hello / There / Done -1', 'Hello / Done -1', 'Done -1', 'Hello / There / Done Bob', 'b', 'عند حدوث الخطأ تُهمَل باقي أسطر الـ try فوراً ولا تُطبع There. القفز إلى except يكون فورياً من نقطة الخطأ.'),
(90, 'التنفيذ الشرطي', 'تتبّع المخرجات (Output)', 'If the user enters forty-two, what is printed?
rawstr = input(''Enter a number:'')
try:
    ival = int(rawstr)
except:
    ival = -1
if ival > 0:
    print(''Nice work'')
else:
    print(''Not a number'')', 'Nice work', 'Not a number', 'ValueError', 'Nothing', 'b', 'فشل التحويل جعل ival تساوي -1، والشرط -1 > 0 خاطئ فنُفِّذ فرع else.'),
(91, 'التنفيذ الشرطي', 'أسئلة اختيار (MCQ)', 'If the user enters thirty in this code, what is the value of temp?
try:
    temp = int(input(''Enter the temperature: ''))
except:
    temp = -1', '30', 'thirty', '-1', '0', 'c', 'النص thirty غير قابل للتحويل لعدد فتُرمى ValueError وينتقل التنفيذ إلى except حيث تُسند القيمة -1.'),
(92, 'التنفيذ الشرطي', 'أسئلة اختيار (MCQ)', 'When is the except block executed?', 'Always', 'Only if the try block raises an error', 'Before the try block', 'Only at the end of the program', 'b', 'كتلة except لا تُنفَّذ إلا عند حدوث خطأ فعلي داخل try. إذا نجح الكود تُتخطى تماماً.'),
(93, 'التنفيذ الشرطي', 'أسئلة اختيار (MCQ)', 'Which error type does int(''Hello Bob'') raise?', 'TypeError', 'ValueError', 'NameError', 'IndentationError', 'b', 'النوع المُمرَّر صحيح وهو نص لكن القيمة غير قابلة للتحويل، وهذا تعريف ValueError بالضبط.'),
(94, 'التنفيذ الشرطي', 'اكتشاف الأخطاء (Bug)', 'Find the bug:
x = 5
if x > 2
    print(''Bigger'')', 'print is misspelled', 'Missing colon after the if condition', 'x must be a string', 'There is no bug', 'b', 'كل جملة if تحتاج نقطتين : في نهايتها وإلا SyntaxError. الإزاحة هنا صحيحة والمشكلة في النقطتين فقط.'),
(95, 'التنفيذ الشرطي', 'اكتشاف الأخطاء (Bug)', 'Find the bug:
x = 5
if x > 2 :
print(''Bigger'')', 'IndentationError because the block is not indented', 'SyntaxError because of the colon', 'NameError', 'There is no bug', 'a', 'بعد النقطتين يجب أن يبدأ سطر مُزاح، وغياب الإزاحة يعطي IndentationError: expected an indented block.'),
(96, 'التنفيذ الشرطي', 'اكتشاف الأخطاء (Bug)', 'Find the bug:
x = 5
if x = 5:
    print(''Equals 5'')', 'Use == instead of = for comparison', 'Missing colon', 'x is undefined', 'There is no bug', 'a', 'داخل الشرط نستخدم == للمقارنة وليس = المخصصة للإسناد، وإلا SyntaxError.'),
(97, 'التنفيذ الشرطي', 'اكتشاف الأخطاء (Bug)', 'Find the bug:
x = 5
print(''start'')
else:
    print(''other'')', 'else must follow an if statement', 'print cannot come before else', 'Missing colon', 'There is no bug', 'a', 'لا يمكن كتابة else وحدها دون if سابقة لها بنفس المستوى، والنتيجة SyntaxError.'),
(98, 'التنفيذ الشرطي', 'اكتشاف الأخطاء (Bug)', 'A student wrote this for: print Pass if mark above 50, ALWAYS print Welcome.
mark = int(input(''Mark: ''))
if mark > 50:
    print(''Pass'')
    print(''Welcome'')
What is wrong?', 'Nothing is wrong', 'Welcome is indented so it only prints when mark > 50', 'It should use elif', 'int() is wrong here', 'b', 'كلمة always تعني أن السطر يجب أن يكون خارج الكتلة بدون إزاحة، وإلا لن يُطبع عندما تكون العلامة 50 أو أقل.'),
(99, 'التنفيذ الشرطي', 'اكتشاف الأخطاء (Bug)', 'Find the bug:
mark = input(''Enter your mark: '')
if mark > 50:
    print(''Pass'')', 'Missing colon', 'TypeError comparing str with int', 'mark is a reserved word', 'There is no bug', 'b', 'input() تُرجع نصاً ومقارنة النص بعدد في Python 3 ترمي TypeError. الحل: int(input(...)) قبل المقارنة.'),
(100, 'التنفيذ الشرطي', 'اكتشاف الأخطاء (Bug)', 'Find the bug:
x = 5
if x < 2:
    print(''Small'')
else x > 2:
    print(''Big'')', 'else cannot take a condition, use elif', 'Missing colon after else', 'x must be float', 'There is no bug', 'a', 'الكلمة else لا تقبل شرطاً إطلاقاً، وإذا احتجنا شرطاً إضافياً نستخدم elif بدلاً منها.'),
(101, 'التنفيذ الشرطي', 'اكتشاف الأخطاء (Bug)', 'Which code correctly prints Pass for a mark above 50 and Welcome in all cases?', 'if mark > 50: print(''Pass'') / print(''Welcome'')  [Welcome not indented]', 'Both prints indented inside if', 'Both prints outside the if', 'Using else for Welcome', 'a', 'الحل الصحيح أن تكون Pass داخل الكتلة و Welcome خارجها بدون إزاحة. الخيار B يمنع طباعة الترحيب عند الرسوب والخيار C يطبع Pass دائماً.'),
(102, 'التنفيذ الشرطي', 'أسئلة اختيار (MCQ)', 'What if the user selects a pizza type that is neither pepperoni nor vegetarian in this code?
if pizza == ''pepperoni'':
    print(''2.00 JD'')
elif pizza == ''vegetarian'':
    print(''3.00 JD'')
print(''PIZZA'')', 'An error occurs', 'Only PIZZA is printed', 'Nothing is printed', '3.00 JD is printed', 'b', 'بغياب else لا يُنفَّذ أي فرع من السلسلة، لكن سطر PIZZA خارجها فيُطبع دائماً.'),
(103, 'التنفيذ الشرطي', 'أسئلة اختيار (MCQ)', 'In Python, comparing strings with == is:', 'Not allowed', 'Allowed and compares the text exactly', 'Only allowed with numbers inside', 'Always False', 'b', 'المقارنة بين النصوص مسموحة وتقارن المحتوى حرفاً بحرف مع مراعاة حالة الأحرف، فـ ''Pizza'' لا تساوي ''pizza''.'),
(104, 'التنفيذ الشرطي', 'تتبّع المخرجات (Output)', 'What is the output?
x = ''pepperoni''
if x == ''Pepperoni'':
    print(''Match'')
else:
    print(''No match'')', 'Match', 'No match', 'TypeError', 'Nothing', 'b', 'المقارنة حساسة لحالة الأحرف فالحرف الكبير في البداية يجعل النصين مختلفين، لذلك نُفِّذ فرع else.'),
(105, 'التنفيذ الشرطي', 'تتبّع المخرجات (Output)', 'What is the output?
x = 5
if x == 5:
    pass
print(''Done'')', 'SyntaxError', 'Done', '5 then Done', 'Nothing', 'b', 'الكلمة pass جملة فارغة لا تفعل شيئاً وتُستخدم لملء الكتلة نحوياً، ثم يُطبع السطر الأخير عادياً.'),
(106, 'التنفيذ الشرطي', 'أسئلة اختيار (MCQ)', 'How many outputs can a chain of if / elif / elif / else produce for one run?', 'Zero or one', 'Exactly one', 'Two', 'As many as the conditions that are True', 'b', 'وجود else يضمن تنفيذ فرع واحد بالضبط لا أكثر ولا أقل. بدون else كانت الإجابة صفر أو واحد.'),
(107, 'التنفيذ الشرطي', 'أسئلة اختيار (MCQ)', 'Which structure would you use for a value that must be classified into more than two ranges?', 'Nested if only', 'A chain of if and elif and else', 'try / except', 'A single if', 'b', 'سلسلة elif هي البنية المخصصة للقرارات متعددة الاتجاهات وهي أوضح وأسهل قراءة من التداخل العميق.'),
(108, 'التنفيذ الشرطي', 'تتبّع المخرجات (Output)', 'What is the output?
try:
    x = int(''10'')
    y = 10 / 0
    print(''OK'')
except:
    print(''Error caught'')
print(''End'')', 'OK then End', 'Error caught then End', 'OK then Error caught then End', 'ZeroDivisionError', 'b', 'أول سطر نجح لكن القسمة على صفر رمت خطأً فقُفز إلى except ولم تُطبع OK، ثم أكمل البرنامج للسطر الأخير.'),
(109, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'What is a function in Python?', 'A built-in Python command', 'A reusable block of code that performs a specific task', 'A loop that repeats multiple times', 'A variable that holds a string', 'b', 'الدالة كتلة كود قابلة لإعادة الاستخدام تؤدي مهمة محددة. الخيار A ناقص لأن الدوال ليست كلها built-in، والخيار C يصف الحلقات، والخيار D يصف المتغيرات.'),
(110, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'What keyword is used to define a function in Python?', 'function', 'define', 'def', 'func', 'c', 'الكلمة المحجوزة def هي الوحيدة المستخدمة لتعريف الدوال في Python. باقي الكلمات من لغات أخرى مثل JavaScript وPHP وSwift.'),
(111, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'Which of the following is a built-in function in Python?', 'max()', 'print()', 'input()', 'All of the above', 'd', 'الدوال print و input و max و type و float و int كلها built-in تأتي جاهزة مع Python دون الحاجة لتعريفها.'),
(112, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'How many kinds of functions are there in Python according to the chapter?', 'One kind only', 'Two: built-in and user-defined', 'Three: built-in, user-defined and recursive', 'Four', 'b', 'الفصل يقسمها لنوعين فقط: دوال مبنية جاهزة، ودوال نعرّفها بأنفسنا. الـ recursion ليست نوعاً ثالثاً بل أسلوب استدعاء داخل دالة معرّفة.'),
(113, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'What is the correct way to define a function with parameters?', 'def function_name(parameter1, parameter2):', 'function function_name(parameter1, parameter2):', 'define function_name(parameter1, parameter2):', 'func function_name(parameter1, parameter2):', 'a', 'الصيغة الصحيحة هي def ثم الاسم ثم الأقواس بداخلها الـ parameters ثم النقطتين. باقي الكلمات ليست محجوزة في Python وتعطي SyntaxError.'),
(114, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'Why do we treat function names as ''new'' reserved words?', 'Because Python forbids using them', 'To avoid using them as variable names and destroying the function', 'Because they are stored in memory', 'Because they are uppercase', 'b', 'تقنياً يمكنك كتابة print = 5 دون خطأ نحوي لكنها تدمر الدالة الأصلية، لذلك نتجنب أسماء الدوال كأسماء متغيرات كأنها محجوزة.'),
(115, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'What happens when Python executes a def statement?', 'It runs the body of the function immediately', 'It defines the function but does not execute its body', 'It prints the function name', 'It returns None', 'b', 'جملة def تُسجّل الدالة في الذاكرة فقط، ومحتواها لا يُنفَّذ إطلاقاً حتى يتم استدعاؤها بالاسم مع الأقواس.'),
(116, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'How do we call or invoke a function?', 'By writing its name only', 'By writing its name followed by parentheses and arguments if needed', 'By writing def before its name', 'By writing return before its name', 'b', 'الأقواس هي ما يُنفّذ الدالة فعلياً. كتابة الاسم وحده بدون أقواس تشير للدالة ككائن ولا تنفذها.'),
(117, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'What is the difference between a parameter and an argument?', 'They are exactly the same', 'A parameter is in the definition, an argument is the value passed at the call', 'A parameter is passed, an argument is defined', 'A parameter must be a number', 'b', 'الـ parameter متغير يُكتب في سطر تعريف الدالة، والـ argument القيمة الفعلية التي نمررها وقت الاستدعاء. الخيار C يعكس التعريفين.'),
(118, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'In the call greet(''es''), what is ''es'' called?', 'Parameter', 'Argument', 'Return value', 'Keyword', 'b', 'القيمة المكتوبة داخل أقواس الاستدعاء تُسمى argument. أما lang في سطر التعريف def greet(lang) فهي الـ parameter.'),
(119, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'In def greet(lang):, what is lang called?', 'Argument', 'Parameter', 'Result', 'Global variable', 'b', 'المتغير المكتوب في سطر تعريف الدالة هو parameter، وهو المقبض الذي يستقبل قيمة الـ argument عند الاستدعاء.'),
(120, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'Which keyword sends a result back from a function?', 'print', 'send', 'return', 'output', 'c', 'الكلمة return هي التي تُرجع القيمة لمكان الاستدعاء. أما print فتطبع على الشاشة فقط ولا تُرجع قيمة قابلة للتخزين.'),
(121, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'A function that produces a result is called:', 'A void function', 'A fruitful function', 'A recursive function', 'A built-in function', 'b', 'المصطلح fruitful يعني أن الدالة تُرجع قيمة عبر return. أما void فهي التي لا تُرجع شيئاً وتوصف بأنها not fruitful.'),
(122, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'A function that does NOT return a value is called:', 'Fruitful', 'Void (non-fruitful)', 'Empty', 'Static', 'b', 'الدالة التي لا تحتوي return تُسمى void أو non-fruitful، وهي في الحقيقة تُرجع None ضمنياً.'),
(123, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'What does the return statement do besides sending back a value?', 'It prints the value', 'It ends the function execution immediately', 'It restarts the function', 'It converts the value to string', 'b', 'جملة return تُنهي تنفيذ الدالة فوراً، وأي سطر بعدها داخل نفس الدالة لن يُنفَّذ إطلاقاً.'),
(124, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'When calling a function with multiple parameters, what must match?', 'Only the number of arguments', 'Only the order of arguments', 'Both the number and the order of arguments', 'The names of the variables', 'c', 'يجب تطابق العدد والترتيب معاً بين الـ arguments والـ parameters. أسماء المتغيرات خارج الدالة لا علاقة لها بالمطابقة.'),
(125, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'What does the max() function do when applied to a string?', 'Returns the longest word', 'Returns the highest ASCII value character', 'Returns the first character of the string', 'Converts the string to uppercase', 'b', 'الدالة max على نص تقارن الأحرف حسب قيمها في ASCII وتُرجع الحرف الأعلى. الأحرف الصغيرة قيمتها أعلى من الكبيرة.'),
(126, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'What does the float() function do?', 'Converts a string to a float', 'Converts an integer to a float', 'Both A and B', 'It does nothing', 'c', 'الدالة float تقبل النصوص الرقمية والأعداد الصحيحة وتحوّلها لعدد عشري. لكنها ترمي ValueError إذا كان النص غير رقمي.'),
(127, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'Why should we use functions in our programs?', 'To make the program run faster', 'To avoid repeating code and organize logic into named chunks', 'Because Python requires them', 'To use less memory', 'b', 'الفائدة الأساسية تنظيمية: لا تكرر نفسك واكتب الكود مرة وأعد استخدامه. السرعة والذاكرة ليستا السبب الرئيسي المذكور في الفصل.'),
(128, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'What is the output?
def add(a, b):
    return a + b
print(add(3, 5))', 'None', '8', '3 + 5', 'Error', 'b', 'الدالة تُرجع ناتج الجمع 8 فتطبعه print. لو استُبدلت return بـ print داخل الدالة لطُبع 8 ثم None.'),
(129, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'What is the output?
def multiply(a, b):
    return a * b
print(multiply(4, 5))', '20', '9', '45', 'Error', 'a', 'الدالة تُرجع حاصل الضرب 4 × 5 = 20. الخيار B ناتج جمع والخيار C مجرد لصق الرقمين.'),
(130, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'What is the output?
def addtwo(a, b):
    added = a + b
    return added
x = addtwo(3, 5)
print(x)', '3 5', '35', '8', 'None', 'c', 'القيمتان تُمرَّران بالترتيب فتصبح a=3 و b=5، والناتج 8 يُخزَّن في x. المتغير added محلي داخل الدالة فقط.'),
(131, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'What is the output?
def thing():
    print(''Hello'')
    print(''Fun'')
thing()
print(''Guys'')
thing()', 'Hello Fun Guys', 'Hello Fun Guys Hello Fun', 'Guys Hello Fun', 'Hello Fun Hello Fun Guys', 'b', 'الاستدعاء الأول يطبع سطرين ثم يُطبع Guys ثم الاستدعاء الثاني يطبع السطرين مجدداً، وهذا جوهر نمط التخزين وإعادة الاستخدام.'),
(132, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'What is the output?
x = 5
print(''Hello'')
def print_lyrics():
    print(''Lumberjack'')
print(''Yo'')
x = x + 2
print(x)', 'Hello Yo Lumberjack 7', 'Hello Yo 7', 'Hello Lumberjack Yo 7', 'Lumberjack only', 'b', 'الدالة عُرِّفت ولم تُستدعَ أبداً فلم يُنفَّذ محتواها إطلاقاً. مجرد وجود def لا يعني التنفيذ.'),
(133, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'What is the output?
x = 5
print(''Hello'')
def print_lyrics():
    print(''Lumberjack'')
print(''Yo'')
print_lyrics()
x = x + 2
print(x)', 'Hello Yo 7', 'Hello Yo Lumberjack 7', 'Hello Lumberjack Yo 7', 'Error', 'b', 'هنا تم الاستدعاء بعد Yo فنُفِّذ محتوى الدالة في مكانه بالضبط ثم عاد التنفيذ للسطر التالي.'),
(134, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'What is the output?
def greet():
    return ''Hello''
print(greet(), ''Glenn'')', 'Hello Glenn', 'HelloGlenn', 'Hello, Glenn', 'None Glenn', 'a', 'القيمة المُرجَعة تحل محل استدعاء الدالة، والفاصلة في print تضيف مسافة تلقائية بين القيمتين.'),
(135, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'What is the output?
def greet(lang):
    if lang == ''es'':
        return ''Hola''
    elif lang == ''fr'':
        return ''Bonjour''
    else:
        return ''Hello''
print(greet(''fr''), ''Michael'')', 'Hello Michael', 'Hola Michael', 'Bonjour Michael', 'None Michael', 'c', 'الشرط الأول خاطئ والثاني صحيح فأُرجعت Bonjour وانتهت الدالة فوراً دون فحص else.'),
(136, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'What is the output?
def greet(lang):
    if lang == ''es'':
        return ''Hola''
    else:
        return ''Hello''
print(greet(''en''), ''Glenn'')', 'Hola Glenn', 'Hello Glenn', 'en Glenn', 'Error', 'b', 'القيمة en لا تطابق es فنُفِّذ فرع else وأُرجعت Hello. المقارنة بين النصوص تتم بـ == عادي.'),
(137, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'What is the output?
>>> big = max(''Hello world'')
>>> print(big)', 'H', 'o', 'w', 'd', 'c', 'الحرف w قيمته 119 في ASCII وهي الأعلى بين كل أحرف النص. الأحرف الصغيرة أعلى من الكبيرة والمسافة هي الأدنى.'),
(138, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'What is the output?
>>> tiny = min(''Hello world'')
>>> print(tiny)', 'H', 'd', 'A space character', 'e', 'c', 'المسافة قيمتها 32 في ASCII وهي الأدنى بين كل الأحرف الموجودة، لذلك تُرجعها min. لو لم تكن هناك مسافة لكانت الإجابة H.'),
(139, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'What is the output?
print(max(''Hello World''))', 'H', 'W', 'r', 'o', 'c', 'الحرف r قيمته 114 وهي الأعلى في النص، بينما W قيمتها 87 فقط لأن الأحرف الكبيرة أدنى من الصغيرة في ASCII. تنبيه: إجابة السلايد W غير دقيقة، وPython الفعلية تُرجع r.'),
(140, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'What is the output?
def fun(text):
    return max(text)
print(fun(''Python''))', 'P', 't', 'y', 'n', 'c', 'الحرف y قيمته 121 وهي الأعلى في كلمة Python، وحرف P كبير قيمته 80 فقط. تنبيه: إجابة السلايد t غير دقيقة والصحيح y.'),
(141, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'What is the output?
def check(num):
    if num > 10:
        return ''Greater than 10''
    elif num == 10:
        return ''Equal to 10''
    else:
        return ''Less than 10''
print(check(15))', 'Greater than 10', 'Equal to 10', 'Less than 10', 'None', 'a', 'القيمة 15 أكبر من 10 فتحقق الشرط الأول وأُرجعت الجملة الأولى وانتهت الدالة مباشرة.'),
(142, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'What is the output?
def compare(a, b):
    return max(a, b) - min(a, b)
print(compare(10, 20))', '30', '10', '-10', '20', 'b', 'دالتا max و min تعملان على الأرقام أيضاً، فالناتج 20 - 10 = 10 وهو الفرق المطلق بين القيمتين.'),
(143, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'What is the output?
print(float(99) / 100)', '0.99', '99.0', '1', 'Error', 'a', 'التحويل يجعل القيمة 99.0 ثم القسمة على 100 تعطي 0.99. حتى بدون float كانت النتيجة نفسها لأن / تُرجع float دائماً.'),
(144, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'What is the output?
print(1 + 2 * float(3) / 4 - 5)', '-2.5', '2.5', '-1.5', '0.5', 'a', 'يُحسب 2 * 3.0 = 6.0 ثم 6.0 / 4 = 1.5 ثم 1 + 1.5 - 5 = -2.5. الضرب والقسمة قبل الجمع والطرح.'),
(145, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'What is the output?
sval = ''123''
ival = int(sval)
print(ival + 1)', '1231', '124', 'TypeError', 'ValueError', 'b', 'بعد التحويل صارت القيمة عدداً صحيحاً فالجمع حسابي وينتج 124. بدون التحويل كان print(sval + 1) يعطي TypeError.'),
(146, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'What is the output?
def f(a, b):
    return a - b
print(f(5, 3), f(3, 5))', '2 2', '2 -2', '-2 2', '8 8', 'b', 'ترتيب الـ arguments يهم: الاستدعاء الأول 5-3=2 والثاني 3-5=-2. عكس الترتيب يعكس النتيجة.'),
(147, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'What is the output?
def show(x):
    print(x)
result = show(7)
print(result)', '7 then 7', '7 then None', 'None then 7', 'Error', 'b', 'الدالة void تطبع 7 لكنها لا تحتوي return فتُرجع None ضمنياً، لذلك طُبعت None في السطر الثاني.'),
(148, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'What is the output?
def f():
    return 1
    return 2
print(f())', '1', '2', '1 2', 'Error', 'a', 'أول return يُنهي تنفيذ الدالة فوراً، والسطر الثاني كود ميت لا يُنفَّذ إطلاقاً.'),
(149, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'Find the bug:
function add(a, b):
    return a + b', 'return must be print', 'The keyword must be def not function', 'Parameters must be strings', 'There is no bug', 'b', 'الكلمة function غير موجودة في Python والصحيح def، والنتيجة SyntaxError. هذه الكلمة من JavaScript.'),
(150, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'Find the bug:
def greet():
    print(''Hello'')
greet', 'Nothing is printed because the call needs parentheses', 'greet must be uppercase', 'print needs a return', 'SyntaxError', 'a', 'كتابة الاسم بدون أقواس تشير للدالة ككائن ولا تنفذها، فلا يُطبع شيء. الصحيح greet() بالأقواس.'),
(151, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'Find the bug:
def print_lyrics():
print(''Hello'')', 'Missing colon', 'IndentationError because the body is not indented', 'print is a reserved word', 'There is no bug', 'b', 'جسم الدالة يجب أن يكون مُزاحاً بعد النقطتين، وغياب الإزاحة يعطي IndentationError: expected an indented block.'),
(152, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'Find the bug:
def addtwo(a, b):
    return a + b
print(addtwo(3))', 'TypeError: missing 1 required positional argument', 'It prints 3', 'It prints None', 'There is no bug', 'a', 'الدالة تتوقع وسيطين لكن مُرِّر واحد فقط، فيجب مطابقة العدد والترتيب وإلا TypeError.'),
(153, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'Find the bug:
def add(a, b):
    print(a + b)
x = add(2, 3)
print(x + 1)', 'It prints 6', 'TypeError because add returns None not a number', 'SyntaxError', 'There is no bug', 'b', 'استُخدمت print بدل return فالدالة void وتُرجع None، وجمع None مع رقم يعطي TypeError. الحل استبدال print بـ return.'),
(154, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'Find the bug:
def f(x):
    return x * 2
print(y)', 'f was never called and y is undefined so NameError', 'TypeError', 'The function needs two parameters', 'There is no bug', 'a', 'المتغير y لم يُعرَّف إطلاقاً فالنتيجة NameError، كما أن الدالة نفسها لم تُستدعَ.'),
(155, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'A student wants a function that returns the tax rate. Which line is correct inside the function?', 'print(''Tax is 30%'')', 'return ''Tax is 30%''', 'output ''Tax is 30%''', 'send ''Tax is 30%''', 'b', 'إذا أردنا قيمة قابلة للتخزين والاستخدام لاحقاً نستخدم return. أما print فتعرض النص فقط ولا يمكن الاستفادة منه في حسابات لاحقة.'),
(156, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'What is recursion in Python?', 'A function that calls another function', 'A function that calls itself', 'A loop that runs until a condition is met', 'A function that never executes', 'b', 'الـ recursion هو استدعاء الدالة لنفسها من داخل جسمها. استدعاء دالة لدالة أخرى هو استدعاء عادي وليس تكراراً ذاتياً.'),
(157, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'What will happen if a recursive function does not have a stopping condition?', 'It will execute once and stop', 'It will cause an infinite loop', 'It will return 0', 'It will throw a syntax error', 'b', 'بدون شرط توقف تستدعي الدالة نفسها بلا نهاية حتى ينفد المكدس وتظهر RecursionError. ليس خطأً نحوياً لأن الكود سليم نحوياً.'),
(158, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'What is the base case in a recursive function?', 'The case that stops further recursive calls', 'The case where recursion starts', 'The case where the function returns itself', 'The first call to the function', 'a', 'الـ base case هي الحالة التي تُرجع قيمة مباشرة دون استدعاء جديد فتوقف السلسلة. بدونها لا تنتهي العملية أبداً.'),
(159, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'Which statement is generally used to stop recursion?', 'for statement', 'while statement', 'if...else statement', 'try...except statement', 'c', 'نستخدم if لفحص شرط التوقف و else للاستدعاء التكراري. هذا هو النمط القياسي المذكور في الفصل.'),
(160, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'In the code: if num == 1: return 1 else: return num + calculate_sum(num - 1), which part is the recursive call?', 'return 1', 'num == 1', 'calculate_sum(num - 1)', 'The print statement', 'c', 'الاستدعاء التكراري هو حيث تنادي الدالة نفسها باسمها مع قيمة أصغر. أما return 1 فهي الـ base case.'),
(161, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'Why must the argument change on each recursive call?', 'To make the code shorter', 'So the function eventually reaches the base case', 'Because Python requires it', 'To save memory', 'b', 'لو بقي الوسيط ثابتاً لما وصلنا لشرط التوقف أبداً واستمر الاستدعاء بلا نهاية. لهذا نستخدم num - 1 مثلاً.'),
(162, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'What error does Python raise when recursion goes too deep?', 'ValueError', 'TypeError', 'RecursionError', 'IndentationError', 'c', 'عند تجاوز الحد الأقصى لعمق الاستدعاءات تظهر RecursionError: maximum recursion depth exceeded كحماية من انهيار الذاكرة.'),
(163, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'What is the output?
def factorial(n):
    if n == 0:
        return 1
    return n * factorial(n - 1)
print(factorial(5))', '10', '15', '120', '25', 'c', 'المضروب هو 5×4×3×2×1 = 120. الخيار A هو مجموع الأعداد وليس مضروبها.'),
(164, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'What is the output?
def calculate_sum(num):
    if num == 1:
        return 1
    return num + calculate_sum(num - 1)
result = calculate_sum(4)
print(result)', '4', '10', '24', '1', 'b', 'الدالة تجمع 4+3+2+1 = 10 عبر الاستدعاءات المتتالية حتى تصل للـ base case عند 1. الخيار C هو المضروب وليس المجموع.'),
(165, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'What is the output?
def count_down(n):
    if n == 0:
        return
    print(n)
    count_down(n - 1)
count_down(3)', '3 2 1', '1 2 3', '3 2 1 0', 'Error', 'a', 'الطباعة تحدث قبل الاستدعاء التكراري فتنزل تنازلياً، وعند وصول n للصفر ترجع return فوراً دون طباعة الصفر.'),
(166, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'What is the output when calling print_number(2)?
def print_number(number):
    print(number)
    if number == 0:
        print(''Stop Printing'')
    else:
        print_number(number - 1)', '2 1 0 Stop Printing', '0 Stop Printing 2 1', 'Stop Printing 2 1', 'Error', 'a', 'الطباعة تسبق الفحص فتُطبع 2 ثم 1 ثم 0، وعند الصفر يتحقق الشرط فتُطبع Stop Printing وتنتهي السلسلة.'),
(167, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'What is the output?
def f(n):
    if n == 0:
        return
    f(n - 1)
    print(n)
f(3)', '3 2 1', '1 2 3', '0 1 2 3', 'Nothing', 'b', 'هنا الاستدعاء يسبق الطباعة فتتراكم الاستدعاءات حتى الصفر ثم تُطبع أثناء العودة تصاعدياً. مقارنة هذا بالسؤال السابق تكشف أهمية ترتيب السطرين.'),
(168, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'What is the output?
def factorial(n):
    if n == 0:
        return 1
    return n * factorial(n - 1)
print(factorial(0))', '0', '1', 'None', 'RecursionError', 'b', 'القيمة صفر تطابق الـ base case مباشرة فتُرجع 1 دون أي استدعاء تكراري، وهذا يتوافق مع التعريف الرياضي للمضروب.'),
(169, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'How many times is the function body executed?
def calculate_sum(num):
    if num == 1:
        return 1
    return num + calculate_sum(num - 1)
calculate_sum(4)', '1 time', '3 times', '4 times', '10 times', 'c', 'الاستدعاءات هي 4 و 3 و 2 و 1 فيكون المجموع أربع مرات، والأخيرة هي التي تحقق شرط التوقف.'),
(170, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'Find the bug:
def greet():
    print(''Hello'')
    greet()
greet()', 'SyntaxError', 'No stopping condition so it recurses infinitely until RecursionError', 'greet cannot call itself', 'It prints Hello once', 'b', 'الدالة تستدعي نفسها بلا شرط توقف فتطبع Hello مراراً حتى ينفد عمق الاستدعاء وتظهر RecursionError.'),
(171, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'Find the bug:
def f(n):
    if n == 0:
        return 1
    return n * f(n)', 'The argument never decreases so it never reaches the base case', 'Missing colon', 'return 1 should be return 0', 'There is no bug', 'a', 'الاستدعاء يمرر n نفسها دون إنقاص فلا نصل للـ base case أبداً. الصحيح f(n - 1).'),
(172, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'Find the bug:
def fact(n):
    return n * fact(n - 1)
print(fact(5))', 'Missing base case so RecursionError', 'It prints 120', 'TypeError', 'SyntaxError', 'a', 'لا يوجد شرط توقف فتستمر الاستدعاءات بأرقام سالبة بلا نهاية. الحل إضافة if n == 0: return 1 في البداية.'),
(173, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'Find the bug:
def s(n):
    if n == 1:
        return 1
    n + s(n - 1)
print(s(4))', 'It prints 10', 'It prints None because the recursive line has no return', 'RecursionError', 'SyntaxError', 'b', 'السطر الأخير يحسب القيمة لكنه لا يُرجعها، فالدالة تُرجع None ضمنياً. الحل كتابة return n + s(n - 1).'),
(174, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'A student wants factorial of 5 using recursion. Which base case is correct?', 'if n == 5: return 5', 'if n == 0: return 1', 'if n == 1: return 0', 'No base case is needed', 'b', 'الـ base case الصحيح هو مضروب الصفر الذي يساوي 1 لأنه يوقف السلسلة بقيمة محايدة للضرب. الخيار C يجعل الناتج صفراً دائماً.'),
(175, 'الدوال (Functions)', 'أسئلة الدوال والتكرار', 'Which is TRUE about recursion versus a normal function call?', 'Recursion never uses memory', 'Each recursive call adds a new frame on the call stack', 'Recursion is always faster than loops', 'Recursion cannot return values', 'b', 'كل استدعاء يحجز إطاراً جديداً في المكدس، ولهذا يوجد حد أقصى للعمق. التكرار بالحلقات غالباً أوفر في الذاكرة.'),
(176, 'التكرار (Iteration)', 'أسئلة التكرار', 'What is an iteration variable in a loop?', 'A constant that never changes', 'A variable that changes each time through the loop', 'The name of the loop', 'A variable defined after the loop', 'b', 'متغير التكرار يتغير في كل دورة وهو ما يقود الحلقة نحو نهايتها. إذا لم يتغير أبداً تصبح الحلقة لا نهائية.'),
(177, 'التكرار (Iteration)', 'أسئلة التكرار', 'While loops are called:', 'Definite loops', 'Indefinite loops', 'Nested loops', 'Fixed loops', 'b', 'حلقة while تُسمى indefinite لأننا لا نعرف مسبقاً عدد الدورات، فهي تستمر حتى يصبح الشرط False. أما for فهي definite لأنها تنفذ عدداً محدداً من المرات.'),
(178, 'التكرار (Iteration)', 'أسئلة التكرار', 'For loops are called definite loops because:', 'They run forever', 'They execute an exact number of times over a set', 'They need a break statement', 'They only work with numbers', 'b', 'حلقة for تمر على أعضاء مجموعة معروفة الحجم فيكون عدد الدورات محدداً سلفاً. الخيار D خاطئ لأنها تعمل مع النصوص والقوائم أيضاً.'),
(179, 'التكرار (Iteration)', 'أسئلة التكرار', 'In a while loop, when does the loop stop executing?', 'When the condition becomes True', 'When the condition becomes False', 'When the loop reaches 10 iterations', 'When the user presses Enter', 'b', 'الحلقة تستمر ما دام الشرط True وتتوقف عند أول فحص يعطي False. لا يوجد حد افتراضي لعدد الدورات.'),
(180, 'التكرار (Iteration)', 'أسئلة التكرار', 'What causes an infinite loop in a while statement?', 'Using a for loop instead', 'The condition never becomes False because nothing updates it', 'Using print inside the loop', 'Forgetting the colon', 'b', 'إذا لم يتغير المتغير المستخدم في الشرط داخل جسم الحلقة يبقى الشرط True للأبد. نسيان النقطتين يعطي SyntaxError وليس حلقة لا نهائية.'),
(181, 'التكرار (Iteration)', 'أسئلة التكرار', 'What keyword ends the current loop entirely and jumps past it?', 'continue', 'break', 'stop', 'exit', 'b', 'الكلمة break تُنهي الحلقة كاملة وتنتقل لأول سطر بعدها. الكلمة continue لا تنهي الحلقة بل الدورة الحالية فقط.'),
(182, 'التكرار (Iteration)', 'أسئلة التكرار', 'What keyword is used to stop the current iteration and move to the next one in a loop?', 'continue', 'break', 'stop', 'next', 'a', 'الكلمة continue تُنهي الدورة الحالية فقط وتقفز لأعلى الحلقة لبدء الدورة التالية. أما break فتخرج من الحلقة نهائياً.'),
(183, 'التكرار (Iteration)', 'أسئلة التكرار', 'What is the difference between break and continue?', 'They are identical', 'break exits the loop, continue skips to the next iteration', 'break skips one iteration, continue exits', 'continue only works in for loops', 'b', 'الخيار C يعكس التعريفين تماماً. كلاهما يعمل في while و for على حد سواء.'),
(184, 'التكرار (Iteration)', 'أسئلة التكرار', 'Why do we write while True in some programs?', 'Because it is faster', 'When we do not know in advance how many times the loop should run', 'Because Python requires it', 'To avoid using break', 'b', 'نستخدمها عندما يكون التوقف مرتبطاً بحدث داخل الحلقة مثل إدخال المستخدم لكلمة معينة، ونخرج منها بـ break. بدون break تصبح لا نهائية.'),
(185, 'التكرار (Iteration)', 'أسئلة التكرار', 'In the code while True: ... , what stops the loop?', 'The condition becoming False', 'A break statement inside the body', 'The continue statement', 'Nothing can stop it', 'b', 'القيمة True ثابتة ولا تصبح False أبداً، لذلك الخروج الوحيد يكون عبر break داخل جسم الحلقة.'),
(186, 'التكرار (Iteration)', 'أسئلة التكرار', 'What does the None constant represent in Python?', 'The number zero', 'An empty string', 'A special value meaning no value yet', 'False', 'c', 'القيمة None نوع خاص يدل على غياب القيمة، وهي ليست صفراً ولا نصاً فارغاً ولا False رغم أنها تُعامل كقيمة كاذبة منطقياً.'),
(187, 'التكرار (Iteration)', 'أسئلة التكرار', 'Which operator means ''is the same as'' in Python?', '==', 'is', '=', 'in', 'b', 'العامل is يفحص التطابق في الهوية ويُستخدم عادة مع None. العامل == يقارن القيم فقط.'),
(188, 'التكرار (Iteration)', 'أسئلة التكرار', 'Why do we initialize smallest = None instead of smallest = -1?', 'None is faster', 'Because -1 may be smaller than every value in the list and would never be replaced', 'Because None is a number', 'There is no difference', 'b', 'إذا بدأنا بـ -1 وكل الأرقام موجبة فلن يتحقق الشرط أبداً وتبقى النتيجة -1 خاطئة. أما None فتجعلنا نأخذ أول قيمة كبداية صحيحة.'),
(189, 'التكرار (Iteration)', 'أسئلة التكرار', 'What is the output?
n = 5
while n > 0:
    print(n)
    n = n - 1
print(''Blastoff!'')
print(n)', '5 4 3 2 1 Blastoff! 0', '5 4 3 2 1 0 Blastoff!', '5 4 3 2 1 Blastoff!', 'Infinite loop', 'a', 'الحلقة تطبع من 5 حتى 1 وتتوقف عندما تصبح n صفراً لأن الشرط 0 > 0 كاذب، ثم يُطبع Blastoff ثم قيمة n وهي 0.'),
(190, 'التكرار (Iteration)', 'أسئلة التكرار', 'What happens?
n = 5
while n > 0:
    print(''Lather'')
    print(''Rinse'')
print(''Dry off!'')', 'It prints Lather Rinse once', 'It prints Dry off only', 'Infinite loop because n never changes', 'SyntaxError', 'c', 'لا يوجد أي سطر يُنقص n داخل الحلقة فيبقى الشرط 5 > 0 صحيحاً للأبد. سطر Dry off لن يُنفَّذ إطلاقاً.'),
(191, 'التكرار (Iteration)', 'أسئلة التكرار', 'What is the output?
n = 0
while n > 0:
    print(''Lather'')
    print(''Rinse'')
print(''Dry off!'')', 'Lather Rinse Dry off!', 'Dry off!', 'Infinite loop', 'Nothing', 'b', 'الشرط 0 > 0 كاذب من أول فحص فلم يُنفَّذ جسم الحلقة ولا مرة واحدة. هذا يوضح أن while قد تنفذ صفر مرات.'),
(192, 'التكرار (Iteration)', 'أسئلة التكرار', 'What is the result?
x = 0
while x < 3:
    print(x)
    x += 1', '1 2 3', '0 1 2', '0 1 2 3', 'Infinite loop', 'b', 'تبدأ من الصفر وتتوقف عند 3 لأن الشرط 3 < 3 كاذب، فتُطبع 0 و 1 و 2. الاختصار x += 1 يعني x = x + 1.'),
(193, 'التكرار (Iteration)', 'أسئلة التكرار', 'What is the final value of x after this loop ends?
x = 0
while x < 5:
    x += 2', '4', '5', '6', '2', 'c', 'القيم تتوالى 0 ثم 2 ثم 4 ثم 6، وعند 6 يصبح الشرط كاذباً فتتوقف. القيمة النهائية تتجاوز 5 لأن الزيادة بمقدار 2.'),
(194, 'التكرار (Iteration)', 'أسئلة التكرار', 'What is the output?
for i in [5, 4, 3, 2, 1]:
    print(i)
print(''Blastoff!'')', '1 2 3 4 5 Blastoff!', '5 4 3 2 1 Blastoff!', 'Blastoff! only', 'Error', 'b', 'حلقة for تمر على عناصر القائمة بترتيبها الأصلي كما كُتبت وليس بترتيب تصاعدي، ثم يُطبع السطر الأخير خارج الحلقة.'),
(195, 'التكرار (Iteration)', 'أسئلة التكرار', 'What is the output?
friends = [''Joseph'', ''Glenn'', ''Sally'']
for friend in friends:
    print(''Happy New Year:'', friend)
print(''Done!'')', 'One line then Done!', 'Three lines then Done!', 'Done! only', 'Error', 'b', 'جسم الحلقة يُنفَّذ مرة لكل عنصر أي ثلاث مرات، ثم يُطبع Done مرة واحدة لأنه خارج الحلقة.'),
(196, 'التكرار (Iteration)', 'أسئلة التكرار', 'What is the output?
zork = 0
for thing in [9, 41, 12, 3, 74, 15]:
    zork = zork + 1
print(''After'', zork)', 'After 0', 'After 6', 'After 154', 'After 15', 'b', 'هذا نمط العدّ counting فالمتغير يزيد بمقدار واحد لكل عنصر بغض النظر عن قيمته، والقائمة فيها ستة عناصر.'),
(197, 'التكرار (Iteration)', 'أسئلة التكرار', 'What is the output?
zork = 0
for thing in [9, 41, 12, 3, 74, 15]:
    zork = zork + thing
print(''After'', zork)', 'After 6', 'After 154', 'After 74', 'After 0', 'b', 'هذا نمط الجمع summing فتُضاف قيمة كل عنصر للمجموع: 9+41+12+3+74+15 = 154.'),
(198, 'التكرار (Iteration)', 'أسئلة التكرار', 'What is printed as the average?
count = 0
sum = 0
for value in [9, 41, 12, 3, 74, 15]:
    count = count + 1
    sum = sum + value
print(sum / count)', '154', '6', '25.666666666666668', '24', 'c', 'المعدل يجمع نمطي العد والجمع ثم يقسم بعد انتهاء الحلقة: 154 ÷ 6. لاحظ أن القسمة تتم خارج الحلقة وليس داخلها.'),
(199, 'التكرار (Iteration)', 'أسئلة التكرار', 'What is the output?
largest_so_far = -1
for the_num in [9, 41, 12, 3, 74, 15]:
    if the_num > largest_so_far:
        largest_so_far = the_num
print(''After'', largest_so_far)', 'After -1', 'After 9', 'After 74', 'After 15', 'c', 'المتغير يحتفظ بأكبر قيمة رآها حتى الآن ويُحدَّث كلما وجد أكبر منها، فينتهي بالقيمة 74 وهي الأكبر في القائمة.'),
(200, 'التكرار (Iteration)', 'أسئلة التكرار', 'What is the output?
smallest_so_far = -1
for the_num in [9, 41, 12, 3, 74, 15]:
    if the_num < smallest_so_far:
        smallest_so_far = the_num
print(''After'', smallest_so_far)', 'After 3', 'After -1', 'After 9', 'After 74', 'b', 'القيمة الابتدائية -1 أصغر من كل عناصر القائمة فلم يتحقق الشرط ولا مرة وبقيت النتيجة خاطئة. هذا الخطأ هو سبب استخدام None بدل -1.'),
(201, 'التكرار (Iteration)', 'أسئلة التكرار', 'What is the output?
smallest = None
for value in [9, 41, 12, 3, 74, 15]:
    if smallest is None:
        smallest = value
    elif value < smallest:
        smallest = value
print(''After'', smallest)', 'After None', 'After 9', 'After 3', 'After -1', 'c', 'في الدورة الأولى تُؤخذ أول قيمة كبداية لأن smallest تساوي None، ثم يُقارن الباقي فينتهي بـ 3 وهي الأصغر فعلاً.'),
(202, 'التكرار (Iteration)', 'أسئلة التكرار', 'What is the output?
found = False
for value in [9, 41, 12, 3, 74, 15]:
    if value == 3:
        found = True
print(''After'', found)', 'After False', 'After True', 'After 3', 'Error', 'b', 'نمط البحث بمتغير منطقي يبدأ False ويتحول إلى True بمجرد إيجاد المطلوب ويبقى كذلك حتى النهاية.'),
(203, 'التكرار (Iteration)', 'أسئلة التكرار', 'What is the output?
print(''Before'')
for value in [9, 41, 12, 3, 74, 15]:
    if value > 20:
        print(''Large number'', value)
print(''After'')', 'All six numbers', 'Large number 41 and Large number 74 only', 'Nothing between Before and After', 'Large number 74 only', 'b', 'نمط الفلترة يستخدم if داخل الحلقة لالتقاط القيم المطلوبة فقط، والقيمتان الأكبر من 20 هما 41 و 74.'),
(204, 'التكرار (Iteration)', 'أسئلة التكرار', 'What is the output if the user types: hello then done ?
while True:
    line = input(''> '')
    if line == ''done'':
        break
    print(line)
print(''Done!'')', 'hello then Done!', 'hello then done then Done!', 'Done! only', 'Infinite loop', 'a', 'الكلمة hello تُطبع عادياً، وعند إدخال done ينفّذ break فيخرج من الحلقة قبل الوصول لسطر الطباعة، ثم يُطبع Done.'),
(205, 'التكرار (Iteration)', 'أسئلة التكرار', 'What happens to a line starting with # in this code?
while True:
    line = input(''> '')
    if line[0] == ''#'':
        continue
    if line == ''done'':
        break
    print(line)', 'It is printed normally', 'It is skipped and the loop starts a new iteration', 'The loop ends', 'SyntaxError', 'b', 'الكلمة continue تقفز لأعلى الحلقة فوراً متجاوزة بقية السطور بما فيها الطباعة، فلا يُطبع السطر الذي يبدأ بـ #.'),
(206, 'التكرار (Iteration)', 'أسئلة التكرار', 'Find the bug:
n = 5
while n > 0:
    print(n)', 'Missing colon', 'n is never decremented so the loop is infinite', 'print needs a return', 'There is no bug', 'b', 'أي حلقة while تحتاج سطراً يغيّر متغير الشرط، وإلا لن تنتهي أبداً. الحل إضافة n = n - 1 داخل الحلقة.'),
(207, 'التكرار (Iteration)', 'أسئلة التكرار', 'A student wants to find the smallest value but wrote:
smallest = -1
What is wrong?', 'Nothing is wrong', 'The initial value must not be smaller than all data, use None instead', 'It should be a string', 'It should be 0', 'b', 'القيمة الابتدائية -1 تصلح لإيجاد الأكبر مع أرقام موجبة لكنها كارثية لإيجاد الأصغر. الحل الآمن هو البدء بـ None وأخذ أول عنصر.'),
(208, 'التكرار (Iteration)', 'أسئلة التكرار', 'Find the bug:
for i in [1, 2, 3]
    print(i)', 'Missing colon after the sequence', 'The list must be a tuple', 'i must be declared first', 'There is no bug', 'a', 'كل جملة for تحتاج نقطتين في نهايتها قبل الكتلة المُزاحة، وغيابها يعطي SyntaxError.'),
(209, 'التكرار (Iteration)', 'أسئلة التكرار', 'Find the bug:
count = 0
sum = 0
for value in [4, 6]:
    count = count + 1
    sum = sum + value
    print(sum / count)
The student wants only the final average.', 'The division must be outside the loop', 'sum is a reserved word', 'count must start at 1', 'There is no bug', 'a', 'وضع القسمة داخل الحلقة يطبع معدلاً جزئياً في كل دورة. الحساب النهائي يجب أن يكون بعد انتهاء الحلقة.'),
(210, 'التكرار (Iteration)', 'أسئلة التكرار', 'The for loop can iterate over which of the following?', 'A list only', 'A string only', 'A list, tuple, dictionary, set, or string', 'Numbers only', 'c', 'حلقة for في Python تمر على أي تسلسل قابل للتكرار وليس الأرقام فقط، وهذا يميزها عن for في اللغات الأخرى.'),
(211, 'التكرار (Iteration)', 'أسئلة التكرار', 'What is the default starting value of range()?', '1', '0', '-1', 'It must always be given', 'b', 'الدالة range تبدأ من الصفر افتراضياً وتزيد بمقدار 1، وتتوقف قبل الرقم النهائي دون تضمينه.'),
(212, 'التكرار (Iteration)', 'أسئلة التكرار', 'In range(6), is the number 6 included?', 'Yes', 'No, it stops before 6', 'Only if the step is 1', 'Only in Python 2', 'b', 'الحد النهائي دائماً مستثنى في range، فـ range(6) تعطي الأرقام من 0 إلى 5 أي ستة أرقام.'),
(213, 'التكرار (Iteration)', 'أسئلة التكرار', 'What does the third parameter in range(2, 30, 3) represent?', 'The stopping value', 'The starting value', 'The increment (step)', 'The number of items', 'c', 'المعامل الثالث هو مقدار الزيادة بين كل قيمة والتالية. الترتيب هو start ثم stop ثم step.'),
(214, 'التكرار (Iteration)', 'أسئلة التكرار', 'What does the else block in a for loop do?', 'Runs if the loop body fails', 'Runs when the loop finishes normally', 'Runs before the loop', 'It is not allowed in Python', 'b', 'الكتلة else في الحلقات تُنفَّذ عند اكتمال الحلقة طبيعياً. لكنها تُتخطى تماماً إذا خرجت الحلقة بـ break.'),
(215, 'التكرار (Iteration)', 'أسئلة التكرار', 'If a loop is exited using break, what happens to its else block?', 'It still runs', 'It is not executed', 'It runs twice', 'It causes an error', 'b', 'وجود break يعني أن الحلقة لم تكتمل طبيعياً فتُتخطى كتلة else. هذه أهم نقطة في مفهوم else مع الحلقات.'),
(216, 'التكرار (Iteration)', 'أسئلة التكرار', 'In a menu-driven program, why do we wrap the menu in a while loop?', 'To make it faster', 'So the menu repeats until the user chooses to quit', 'Because menus need loops syntactically', 'To validate numbers', 'b', 'البرنامج ذو القائمة يكرر عرض الخيارات حتى يختار المستخدم الخروج، وعندها نستخدم break للخروج من الحلقة.'),
(217, 'التكرار (Iteration)', 'أسئلة التكرار', 'In a menu program, what does the else branch typically handle?', 'The exit choice', 'An invalid choice outside the menu options', 'The first choice', 'Nothing', 'b', 'فرع else يلتقط أي إدخال خارج الخيارات المعروضة ويطبع رسالة خطأ ثم تعيد الحلقة عرض القائمة.'),
(218, 'التكرار (Iteration)', 'أسئلة التكرار', 'What is the output?
for i in range(3):
    print(i)', '1 2 3', '0 1 2', '0 1 2 3', 'Error', 'b', 'الدالة range تبدأ من الصفر وتقف قبل الرقم 3، فتعطي 0 و 1 و 2 أي ثلاث دورات.'),
(219, 'التكرار (Iteration)', 'أسئلة التكرار', 'What is the output?
for x in range(2, 6):
    print(x)', '2 3 4 5 6', '2 3 4 5', '0 1 2 3 4 5', '3 4 5', 'b', 'البداية 2 مُضمَّنة والنهاية 6 مستثناة، فتُطبع الأرقام من 2 إلى 5.'),
(220, 'التكرار (Iteration)', 'أسئلة التكرار', 'How many times will the following loop run?
for i in range(2, 10, 2):
    print(i)', '5', '4', '3', '2', 'b', 'القيم هي 2 و 4 و 6 و 8 فقط لأن 10 مستثناة، أي أربع دورات.'),
(221, 'التكرار (Iteration)', 'أسئلة التكرار', 'What is the output?
for x in range(6, 1, -2):
    print(x)
else:
    print(''Finally finished!'')', '6 4 2 Finally finished!', '6 4 2 1 Finally finished!', '1 2 4 6', 'Error', 'a', 'الخطوة السالبة تجعل العد تنازلياً من 6 وتتوقف قبل 1، ثم تُنفَّذ كتلة else لأن الحلقة اكتملت دون break.'),
(222, 'التكرار (Iteration)', 'أسئلة التكرار', 'What is the output?
for x in range(6):
    if x == 3: break
    print(x)
else:
    print(''Finally finished!'')
print(''Done!'')', '0 1 2 Finally finished! Done!', '0 1 2 Done!', '0 1 2 3 Done!', 'Done! only', 'b', 'الحلقة تطبع 0 و 1 و 2 ثم تخرج بـ break عند 3، ووجود break يمنع تنفيذ كتلة else تماماً.'),
(223, 'التكرار (Iteration)', 'أسئلة التكرار', 'Which range() expression generates the numbers 5, 4, 3, 2, 1?', 'range(1, 6)', 'range(5, 0, -1)', 'range(5, 1, -1)', 'range(1, 5, -1)', 'b', 'نبدأ من 5 ونتوقف قبل 0 بخطوة -1. الخيار C يتوقف عند 2 والخيار D يعطي تسلسلاً فارغاً لأن البداية أصغر من النهاية مع خطوة سالبة.'),
(224, 'التكرار (Iteration)', 'أسئلة التكرار', 'What is printed?
for i in range(3):
    for j in range(2):
        print(i, j)', '0 0 / 1 1 / 2 2', '0 0 / 0 1 / 1 0 / 1 1 / 2 0 / 2 1', '0 0 0 / 1 1 1', 'Error', 'b', 'الحلقة الداخلية تكمل دورتيها لكل قيمة من الحلقة الخارجية فينتج ستة أسطر. عدد الدورات الكلي هو 3 × 2.'),
(225, 'التكرار (Iteration)', 'أسئلة التكرار', 'What is the output?
fruits = [''apple'', ''banana'', ''cherry'']
for x in fruits:
    print(x)
print(''Done!'')', 'apple banana cherry Done!', 'Done! only', '3 Done!', 'Error', 'a', 'الحلقة تمر على عناصر القائمة بترتيبها وتطبع كل عنصر، ثم يُطبع Done مرة واحدة خارج الحلقة.'),
(226, 'التكرار (Iteration)', 'أسئلة التكرار', 'How many lines does this print?
for i in range(1, 10, 3):
    print(i)', '2', '3', '4', '9', 'b', 'القيم هي 1 و 4 و 7 لأن القيمة التالية 10 مستثناة، فالعدد ثلاثة.'),
(227, 'التكرار (Iteration)', 'أسئلة التكرار', 'What is the output?
def menu():
    return 4
while True:
    choice = menu()
    if choice == 4:
        print(''Goodbye'')
        break
    else:
        print(''Invalid'')', 'Infinite Invalid', 'Goodbye once', 'Invalid once', 'Nothing', 'b', 'الدالة تُرجع 4 دائماً فيتحقق الشرط الأول ويُطبع Goodbye ثم يخرج break من الحلقة بعد دورة واحدة.'),
(228, 'التكرار (Iteration)', 'أسئلة التكرار', 'Find the bug:
for x in range(1, 5)
    print(x)', 'range needs three arguments', 'Missing colon after range(1, 5)', 'x must be initialized', 'There is no bug', 'b', 'النقطتان إجبارية في نهاية سطر for وغيابها يعطي SyntaxError. الدالة range تقبل معاملاً واحداً أو اثنين أو ثلاثة.'),
(229, 'التكرار (Iteration)', 'أسئلة التكرار', 'A student wants to print 1 to 5 but wrote: for i in range(5)
What is the problem?', 'It prints 0 to 4 not 1 to 5', 'It prints 1 to 5 correctly', 'range cannot take one argument', 'It prints 5 only', 'a', 'البداية الافتراضية صفر والنهاية مستثناة، فالصحيح لطباعة 1 إلى 5 هو range(1, 6).'),
(230, 'التكرار (Iteration)', 'أسئلة التكرار', 'Find the bug in this menu loop:
while True:
    choice = int(input(''Choice: ''))
    if choice == 1:
        print(''Square'')
    elif choice == 2:
        print(''Exit'')', 'There is no break so the program never exits', 'int() is wrong', 'Missing else', 'There is no bug', 'a', 'خيار الخروج يطبع رسالة فقط دون break فتستمر الحلقة بلا نهاية. يجب إضافة break بعد رسالة الخروج.'),
(231, 'التكرار (Iteration)', 'أسئلة التكرار', 'Find the bug:
for i in range(3, 1):
    print(i)', 'SyntaxError', 'It prints nothing because the step is positive while start is greater than stop', 'It prints 3 2', 'Infinite loop', 'b', 'مع الخطوة الافتراضية الموجبة لا يمكن الوصول من 3 إلى ما قبل 1 فينتج تسلسل فارغ. الحل إضافة خطوة سالبة مثل range(3, 1, -1).'),
(232, 'التكرار (Iteration)', 'أسئلة التكرار', 'For an and comparison to be True:', 'Either condition may be true', 'Both conditions must be true', 'Neither condition must be true', 'Only the first condition matters', 'b', 'العامل and يتطلب تحقق الشرطين معاً. إذا كان الأول كاذباً فلا يُفحص الثاني إطلاقاً وهو ما يُسمى التقييم القصير.'),
(233, 'التكرار (Iteration)', 'أسئلة التكرار', 'For an or comparison to be True:', 'Both conditions must be true', 'At least one condition must be true', 'Both must be false', 'It always returns False', 'b', 'يكفي تحقق شرط واحد ليكون الناتج True. وإذا تحقق الأول فلا يُفحص الثاني توفيراً للوقت.'),
(234, 'التكرار (Iteration)', 'أسئلة التكرار', 'In an and expression, if the first condition is False, what does Python do?', 'It checks the second condition anyway', 'It skips the second condition and returns False', 'It raises an error', 'It returns True', 'b', 'هذا هو مبدأ short-circuit evaluation، فلا فائدة من فحص الثاني ما دام الناتج محسوماً بالكذب.'),
(235, 'التكرار (Iteration)', 'أسئلة التكرار', 'Which expression grants access only to ages between 8 and 12 inclusive?', 'age >= 8 or age <= 12', 'age >= 8 and age <= 12', 'age > 8 and age < 12', 'age == 8 and age == 12', 'b', 'الخيار A يتحقق لأي عمر تقريباً لأن or متساهلة جداً، والخيار C يستثني 8 و 12 نفسيهما، والخيار D مستحيل التحقق.'),
(236, 'التكرار (Iteration)', 'أسئلة التكرار', 'Which condition accepts both uppercase Y and lowercase y?', 'var == ''Y'' and var == ''y''', 'var == ''Y'' or var == ''y''', 'var == ''Yy''', 'var != ''Y''', 'b', 'المقارنة حساسة لحالة الأحرف فنحتاج or لقبول الشكلين. الخيار A مستحيل لأن المتغير لا يمكن أن يساوي قيمتين في وقت واحد.'),
(237, 'التكرار (Iteration)', 'أسئلة التكرار', 'In a while loop with two conditions joined by and, when does the loop terminate?', 'Only when both become false', 'As soon as even one of them becomes false', 'It never terminates', 'After ten iterations', 'b', 'العامل and يتطلب تحقق الطرفين معاً لاستمرار الحلقة، فكذب أحدهما يكفي لإنهائها.'),
(238, 'التكرار (Iteration)', 'أسئلة التكرار', 'What does print(''*'', end='''') do?', 'Prints a star and moves to the next line', 'Prints a star without moving to a new line', 'Prints nothing', 'Ends the program', 'b', 'المعامل end يستبدل سطر النهاية الافتراضي بنص فارغ فتبقى الطباعة على نفس السطر، وهو أساس رسم الأشكال.'),
(239, 'التكرار (Iteration)', 'أسئلة التكرار', 'What does the expression ''*'' * 3 produce?', 'A TypeError', '***', '3 stars on 3 lines', '*3', 'b', 'ضرب نص في عدد صحيح يكرّر النص، فينتج ثلاث نجمات متتالية على نفس السطر.'),
(240, 'التكرار (Iteration)', 'أسئلة التكرار', 'If the user enters 17, what is printed?
age = int(input(''Enter your age: ''))
if ((age >= 8) and (age <= 12)):
    print(''YOU ARE ALLOWED. WELCOME!'')
else:
    print(''SORRY! YOU ARE NOT ALLOWED. BYE!'')', 'YOU ARE ALLOWED. WELCOME!', 'SORRY! YOU ARE NOT ALLOWED. BYE!', 'Both lines', 'Error', 'b', 'الشرط الأول 17 >= 8 صحيح لكن الثاني 17 <= 12 كاذب، والعامل and يتطلب الاثنين معاً فنُفِّذ فرع else.'),
(241, 'التكرار (Iteration)', 'أسئلة التكرار', 'If the user enters 12, what is printed?
if ((age >= 8) and (age <= 12)):
    print(''ALLOWED'')
else:
    print(''NOT ALLOWED'')', 'ALLOWED', 'NOT ALLOWED', 'Nothing', 'Error', 'a', 'استخدام <= و >= يجعل الطرفين 8 و 12 مشمولين في المدى. لو استُخدم < و > لكانت النتيجة NOT ALLOWED.'),
(242, 'التكرار (Iteration)', 'أسئلة التكرار', 'If the user enters n, what is printed?
if (var == ''Y'' or var == ''y''):
    print(''YOU SAID YES'')
elif (var == ''N'' or var == ''n''):
    print(''YOU SAID NO'')
else:
    print(''INVALID INPUT'')', 'YOU SAID YES', 'YOU SAID NO', 'INVALID INPUT', 'Error', 'b', 'الشرط الأول كاذب لأن n ليست Y ولا y، والثاني صحيح فطُبعت رسالة الرفض. تنبيه: بعض مخرجات السلايد لهذا المثال غير مطابقة للكود.'),
(243, 'التكرار (Iteration)', 'أسئلة التكرار', 'If a=1, b=2, c=3, what is printed?
if ((a>b and a>c) and (a != b and a != c)):
    print(a, '' is the largest'')
elif ((b>a and b>c) and (b != a and b != c)):
    print(b, '' is the largest'')
elif ((c>a and c>b) and (c != a and c != b)):
    print(c, '' is the largest'')
else:
    print(''entered numbers are equal'')', '1 is the largest', '2 is the largest', '3 is the largest', 'entered numbers are equal', 'c', 'القيمة 3 أكبر من الاثنتين ومختلفة عنهما فتحقق الشرط الثالث. الشرطان الأولان كاذبان لأن 1 و 2 ليستا الأكبر.'),
(244, 'التكرار (Iteration)', 'أسئلة التكرار', 'If a=b=c=2, what is printed by the same three-number comparison code?', '2 is the largest', 'entered numbers are equal', 'Error', 'Nothing', 'b', 'شرط الأكبرية يستخدم > الصارمة فلا يتحقق مع التساوي، ولا يتحقق شرط الاختلاف أيضاً، فيُنفَّذ فرع else.'),
(245, 'التكرار (Iteration)', 'أسئلة التكرار', 'If the user enters a=3 and b=7, how many times does the loop body run?
count = 0
while count < a and count < b:
    print(''count:'', count)
    count += 1', '7 times', '3 times', '10 times', '0 times', 'b', 'العامل and يجعل الحلقة تتوقف عند أصغر الحدّين، فالقيم هي 0 و 1 و 2 ثم يكذب الشرط count < 3.'),
(246, 'التكرار (Iteration)', 'أسئلة التكرار', 'If the user enters a=0 and b=3, what happens?
count = 0
while count < a and count < b:
    print(''count:'', count)
    count += 1
else:
    print(''End of count:'', count)', 'It prints count 0 then End', 'It prints only End of count: 0', 'Infinite loop', 'Error', 'b', 'الشرط 0 < 0 كاذب من البداية فلم يُنفَّذ جسم الحلقة ولا مرة، لكن كتلة else نُفِّذت لأن الحلقة انتهت دون break.'),
(247, 'التكرار (Iteration)', 'أسئلة التكرار', 'What is the output?
for x in range(1, 4):
    print(''*'' * x)', '* ** ***', '*** ** *', '***', '1 2 3', 'a', 'في كل دورة يتكرر النص بعدد قيمة x فتظهر الأسطر متزايدة الطول. هذا الحل بسطر واحد بديل عن الحلقة المتداخلة.'),
(248, 'التكرار (Iteration)', 'أسئلة التكرار', 'What is the output?
for x in range(1, 4):
    for y in range(1, x+1):
        print(''*'', end='''')
    print('''')', '* ** *** on three lines', '*** on one line', 'Nine stars on one line', 'Error', 'a', 'الحلقة الداخلية تطبع عدداً من النجمات يساوي رقم السطر على نفس السطر، ثم print الفارغة تنقل للسطر التالي.'),
(249, 'التكرار (Iteration)', 'أسئلة التكرار', 'How many stars in total are printed?
for x in range(1, 5):
    print(''*'' * x)', '4', '5', '10', '16', 'c', 'الأسطر تحتوي 1 ثم 2 ثم 3 ثم 4 نجمة فالمجموع 10. عدد الأسطر أربعة وليس عدد النجمات.'),
(250, 'التكرار (Iteration)', 'أسئلة التكرار', 'A student wants ages 8 to 12 only but wrote:
if age >= 8 or age <= 12:', 'It works correctly', 'Using or makes almost every age true, it should be and', 'The comparison operators are reversed', 'Missing colon', 'b', 'أي عمر يحقق أحد الشرطين على الأقل فيدخل الجميع. المطلوب تحقق الشرطين معاً باستخدام and.'),
(251, 'التكرار (Iteration)', 'أسئلة التكرار', 'A student wants to accept Y or y but wrote:
if var == ''Y'' and var == ''y'':', 'It works', 'The condition can never be true, and should be or', 'It needs parentheses', 'It needs elif', 'b', 'من المستحيل أن يساوي المتغير قيمتين مختلفتين في الوقت نفسه فالشرط دائماً كاذب. الصحيح استخدام or.'),
(252, 'التكرار (Iteration)', 'أسئلة التكرار', 'Find the bug:
for x in range(1, 4):
    for y in range(1, x+1):
        print(''*'')
    print('''')', 'It prints each star on its own line because end='''' is missing', 'SyntaxError', 'The inner range is wrong', 'There is no bug', 'a', 'بدون المعامل end تنتقل الطباعة لسطر جديد بعد كل نجمة فينكسر الشكل المطلوب.'),
(253, 'التكرار (Iteration)', 'أسئلة التكرار', 'Find the bug:
count = 0
while count < 3 and count < 5:
    print(count)', 'The and should be or', 'count is never incremented so the loop is infinite', 'Missing colon', 'There is no bug', 'b', 'الشرط المركب سليم لكن لا شيء يغيّر count فيبقى صفراً للأبد. يجب إضافة count += 1 داخل الحلقة.')

on conflict (id) do update set
    section=excluded.section, subsection=excluded.subsection, question=excluded.question,
    option_a=excluded.option_a, option_b=excluded.option_b, option_c=excluded.option_c,
    option_d=excluded.option_d, correct_option=excluded.correct_option, correct_text=excluded.correct_text;
