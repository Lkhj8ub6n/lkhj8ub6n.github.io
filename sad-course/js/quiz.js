// SADCourse - Quiz Management System
class QuizManager {
    constructor(chapterId, topicId) {
        this.chapterId = chapterId;
        this.topicId = topicId;
        this.quizData = null;
        this.currentLang = 'ar';
        this.selectedAnswers = {
            mcq: {},
            tf: {}
        };
    }

    // تحميل بيانات الاختبار من ملف JSON
    async loadQuizData() {
        try {
            const response = await fetch(`../data/chapters/${this.chapterId}/topics/${this.topicId}/quiz.json`);
            this.quizData = await response.json();
            this.renderQuiz();
        } catch (error) {
            console.error('Error loading quiz data:', error);
        }
    }

    // تبديل اللغة
    toggleLanguage() {
        this.currentLang = this.currentLang === 'ar' ? 'en' : 'ar';
        this.renderQuiz();
        return this.currentLang;
    }

    // رسم الاختبار
    renderQuiz() {
        this.renderMCQ();
        this.renderTrueFalse();
        this.attachEventListeners();
    }

    // رسم أسئلة الاختيار من متعدد
    renderMCQ() {
        const container = document.getElementById('mcq-container');
        if (!container || !this.quizData.mcq) return;

        const isEnglish = this.currentLang === 'en';
        const title = isEnglish ? 'Multiple Choice Questions' : 'أسئلة الاختيار من متعدد';
        let html = `<h3><i class="fas fa-list-ol"></i> ${title}</h3>`;

        this.quizData.mcq.forEach((question, index) => {
            const questionText = isEnglish && question.questionEn ? question.questionEn : question.question;
            const options = isEnglish && question.optionsEn ? question.optionsEn : question.options;

            html += `
                <div class="quiz-question" data-question-id="${question.id}">
                    <h5>${index + 1}. ${questionText}</h5>
                    ${options.map((option, optIndex) => `
                        <div class="quiz-option" data-option="${String.fromCharCode(97 + optIndex)}">
                            <input type="radio" name="${question.id}" value="${String.fromCharCode(97 + optIndex)}" id="${question.id}_${optIndex}">
                            <label for="${question.id}_${optIndex}">${option}</label>
                        </div>
                    `).join('')}
                </div>
            `;
        });

        container.innerHTML = html;
    }

    // رسم أسئلة صح وخطأ
    renderTrueFalse() {
        const container = document.getElementById('tf-container');
        if (!container || !this.quizData.trueFalse) return;

        const isEnglish = this.currentLang === 'en';
        const title = isEnglish ? 'True/False Questions' : 'أسئلة صح وخطأ';
        const trueLabel = isEnglish ? 'True' : 'صح';
        const falseLabel = isEnglish ? 'False' : 'خطأ';

        let html = `<h3><i class="fas fa-check-square"></i> ${title}</h3>`;

        this.quizData.trueFalse.forEach((question, index) => {
            const questionText = isEnglish && question.questionEn ? question.questionEn : question.question;

            html += `
                <div class="true-false-question" data-question-id="${question.id}">
                    <h5>${index + 1}. ${questionText}</h5>
                    <div class="true-false-buttons">
                        <button class="tf-btn" data-answer="true" data-question="${question.id}">${trueLabel}</button>
                        <button class="tf-btn" data-answer="false" data-question="${question.id}">${falseLabel}</button>
                    </div>
                </div>
            `;
        });

        container.innerHTML = html;
    }

    // إضافة مستمعي الأحداث
    attachEventListeners() {
        // أسئلة صح وخطأ
        document.querySelectorAll('.tf-btn').forEach(btn => {
            btn.addEventListener('click', (e) => {
                const question = e.target.dataset.question;
                const answer = e.target.dataset.answer === 'true';
                
                // إزالة التحديد من الأزرار الأخرى
                document.querySelectorAll(`[data-question="${question}"]`).forEach(b => {
                    b.classList.remove('selected');
                });
                
                // إضافة التحديد للزر المضغوط
                e.target.classList.add('selected');
                this.selectedAnswers.tf[question] = answer;
            });
        });
    }

    // فحص الإجابات
    checkAnswers() {
        let score = 0;
        let totalQuestions = 0;

        // فحص أسئلة الاختيار من متعدد
        if (this.quizData.mcq) {
            totalQuestions += this.quizData.mcq.length;
            
            this.quizData.mcq.forEach(question => {
                const selectedOption = document.querySelector(`input[name="${question.id}"]:checked`);
                const questionContainer = document.querySelector(`[data-question-id="${question.id}"]`);
                
                // إزالة التنسيق السابق
                questionContainer.querySelectorAll('.quiz-option').forEach(opt => {
                    opt.classList.remove('correct', 'incorrect');
                });

                if (selectedOption) {
                    const selectedValue = selectedOption.value;
                    
                    if (selectedValue === question.correct) {
                        score++;
                        selectedOption.closest('.quiz-option').classList.add('correct');
                    } else {
                        selectedOption.closest('.quiz-option').classList.add('incorrect');
                        // إظهار الإجابة الصحيحة
                        questionContainer.querySelector(`[data-option="${question.correct}"]`).classList.add('correct');
                    }
                }
            });
        }

        // فحص أسئلة صح وخطأ
        if (this.quizData.trueFalse) {
            totalQuestions += this.quizData.trueFalse.length;
            
            this.quizData.trueFalse.forEach(question => {
                const questionContainer = document.querySelector(`[data-question-id="${question.id}"]`);
                const buttons = questionContainer.querySelectorAll('.tf-btn');
                
                // إزالة التنسيق السابق
                buttons.forEach(btn => {
                    btn.classList.remove('correct', 'incorrect');
                });

                if (this.selectedAnswers.tf.hasOwnProperty(question.id)) {
                    const selectedAnswer = this.selectedAnswers.tf[question.id];
                    const correctAnswer = question.correct;
                    
                    if (selectedAnswer === correctAnswer) {
                        score++;
                        buttons.forEach(btn => {
                            if ((btn.dataset.answer === 'true') === correctAnswer) {
                                btn.classList.add('correct');
                            }
                        });
                    } else {
                        buttons.forEach(btn => {
                            if ((btn.dataset.answer === 'true') === selectedAnswer) {
                                btn.classList.add('incorrect');
                            } else if ((btn.dataset.answer === 'true') === correctAnswer) {
                                btn.classList.add('correct');
                            }
                        });
                    }
                } else {
                    // إظهار الإجابة الصحيحة إذا لم يتم الإجابة
                    buttons.forEach(btn => {
                        if ((btn.dataset.answer === 'true') === question.correct) {
                            btn.classList.add('correct');
                        }
                    });
                }
            });
        }

        // حساب النسبة المئوية والدرجة
        this.displayResults(score, totalQuestions);
    }

    // عرض النتائج
    displayResults(score, totalQuestions) {
        const percentage = Math.round((score / totalQuestions) * 100);
        let grade, gradeClass;
        
        if (percentage >= 90) {
            grade = 'ممتاز';
            gradeClass = 'grade-a';
        } else if (percentage >= 80) {
            grade = 'جيد جداً';
            gradeClass = 'grade-b';
        } else if (percentage >= 70) {
            grade = 'جيد';
            gradeClass = 'grade-c';
        } else if (percentage >= 60) {
            grade = 'مقبول';
            gradeClass = 'grade-d';
        } else {
            grade = 'راسب';
            gradeClass = 'grade-f';
        }

        document.getElementById('scoreText').textContent = `النتيجة: ${score}/${totalQuestions} (${percentage}%)`;
        document.getElementById('gradeText').textContent = grade;
        document.getElementById('gradeText').className = `grade-message ${gradeClass}`;
        document.getElementById('quizResults').style.display = 'block';

        // التمرير إلى النتائج
        document.getElementById('quizResults').scrollIntoView({ behavior: 'smooth' });
    }

    // إعادة تعيين الاختبار
    resetQuiz() {
        // إعادة تعيين أسئلة الاختيار من متعدد
        document.querySelectorAll('input[type="radio"]').forEach(input => {
            input.checked = false;
        });

        // إعادة تعيين أسئلة صح وخطأ
        document.querySelectorAll('.tf-btn').forEach(btn => {
            btn.classList.remove('selected', 'correct', 'incorrect');
        });

        // إعادة تعيين التنسيق
        document.querySelectorAll('.quiz-option').forEach(opt => {
            opt.classList.remove('correct', 'incorrect');
        });

        // إعادة تعيين الإجابات المحفوظة
        this.selectedAnswers = {
            mcq: {},
            tf: {}
        };

        // إخفاء النتائج
        document.getElementById('quizResults').style.display = 'none';
    }
}

// Content Loader Class
class ContentLoader {
    static currentLang = 'ar'; // default language
    static contentData = null;

    static async loadContent(chapterId, topicId) {
        try {
            const response = await fetch(`../data/chapters/${chapterId}/topics/${topicId}/content.json`);
            this.contentData = await response.json();
            this.renderContent();
        } catch (error) {
            console.error('Error loading content:', error);
        }
    }

    static toggleLanguage() {
        this.currentLang = this.currentLang === 'ar' ? 'en' : 'ar';
        this.renderContent();
        return this.currentLang;
    }

    static renderContent() {
        const container = document.getElementById('summary-content');
        if (!container || !this.contentData) return;

        const isEnglish = this.currentLang === 'en';
        let html = '';

        this.contentData.sections.forEach(section => {
            const title = isEnglish && section.titleEn ? section.titleEn : section.title;
            html += `<h3>${title}</h3>`;

            section.subsections.forEach(subsection => {
                if (subsection.subtitle) {
                    const subtitle = isEnglish && subsection.subtitleEn ? subsection.subtitleEn : subsection.subtitle;
                    html += `<h4>${subtitle}</h4>`;
                }

                if (subsection.content) {
                    const content = isEnglish && subsection.contentEn ? subsection.contentEn : subsection.content;
                    html += `<p>${content}</p>`;
                }

                if (subsection.list) {
                    const list = isEnglish && subsection.listEn ? subsection.listEn : subsection.list;
                    html += `<${subsection.listType || 'ul'}>`;
                    list.forEach(item => {
                        html += `<li>${item}</li>`;
                    });
                    html += `</${subsection.listType || 'ul'}>`;
                }

                if (subsection.highlight) {
                    const highlightTitle = isEnglish && subsection.highlight.titleEn ? subsection.highlight.titleEn : subsection.highlight.title;
                    const highlightContent = isEnglish && subsection.highlight.contentEn ? subsection.highlight.contentEn : subsection.highlight.content;
                    html += `
                        <div class="highlight-box">
                            <h5>${highlightTitle}</h5>
                            <p>${highlightContent}</p>
                        </div>
                    `;
                }
            });
        });

        container.innerHTML = html;
    }
}

// تصدير الكلاسات للاستخدام العام
window.QuizManager = QuizManager;
window.ContentLoader = ContentLoader;
