// Content Loader Class
class ContentLoader {
    static currentLanguage = 'ar';

    static async loadContent(chapterId, topicId) {
        try {
            const response = await fetch(`../data/chapters/${chapterId}/topics/${topicId}/content.json`);
            const data = await response.json();
            this.renderContent(data);
        } catch (error) {
            console.error('Error loading content:', error);
            document.getElementById('summary-content').innerHTML =
                '<p class="text-danger">حدث خطأ في تحميل المحتوى</p>';
        }
    }

    static applyHighlighting(text) {
        // Replace [[text]] with <mark class="highlight-mark">text</mark>
        return text.replace(/\[\[(.*?)\]\]/g, '<mark class="highlight-mark">$1</mark>');
    }

    static renderContent(data) {
        const container = document.getElementById('summary-content');
        let html = '';
        const lang = this.currentLanguage;

        data.sections.forEach(section => {
            const sectionTitle = lang === 'ar' ? section.title : section.titleEn;
            html += '<h3>' + sectionTitle + '</h3>';

            section.subsections.forEach(subsection => {
                if (subsection.subtitle) {
                    const subtitle = lang === 'ar' ? subsection.subtitle : subsection.subtitleEn;
                    html += '<h4>' + this.applyHighlighting(subtitle) + '</h4>';
                }

                if (subsection.content) {
                    const content = lang === 'ar' ? subsection.content : subsection.contentEn;
                    html += '<p>' + this.applyHighlighting(content) + '</p>';
                }

                if (subsection.list) {
                    const listTag = subsection.listType === 'ol' ? 'ol' : 'ul';
                    const listItems = lang === 'ar' ? subsection.list : subsection.listEn;
                    html += '<' + listTag + '>';
                    listItems.forEach(item => {
                        html += '<li>' + this.applyHighlighting(item) + '</li>';
                    });
                    html += '</' + listTag + '>';
                }

                if (subsection.highlight) {
                    const title = lang === 'ar' ? subsection.highlight.title : subsection.highlight.titleEn;
                    const content = lang === 'ar' ? subsection.highlight.content : subsection.highlight.contentEn;
                    html += '<div class="highlight-box"><h5>' +
                        this.applyHighlighting(title) +
                        '</h5><p>' +
                        this.applyHighlighting(content) +
                        '</p></div>';
                }
            });
        });

        container.innerHTML = html;
    }

    static toggleLanguage() {
        this.currentLanguage = this.currentLanguage === 'ar' ? 'en' : 'ar';
        return this.currentLanguage;
    }

    static reloadContent(chapterId, topicId) {
        this.loadContent(chapterId, topicId);
    }
}

// Quiz Manager Class
class QuizManager {
    constructor(chapterId, topicId) {
        this.chapterId = chapterId;
        this.topicId = topicId;
        this.quizData = null;
        this.userAnswers = {
            mcq: {},
            trueFalse: {}
        };
        this.currentLanguage = 'ar';
    }

    async loadQuizData() {
        try {
            const response = await fetch('../data/chapters/' + this.chapterId + '/topics/' + this.topicId + '/quiz.json');
            this.quizData = await response.json();
            this.renderQuiz();
        } catch (error) {
            console.error('Error loading quiz:', error);
        }
    }

    renderQuiz() {
        this.renderMCQ();
        this.renderTrueFalse();
    }

    renderMCQ() {
        const container = document.getElementById('mcq-container');
        if (!this.quizData || !this.quizData.mcq) {
            container.innerHTML = '';
            return;
        }

        let html = '';
        const lang = this.currentLanguage;

        this.quizData.mcq.forEach((question, qIndex) => {
            html += '<div class="quiz-question" data-question="' + qIndex + '"><h5>' +
                (qIndex + 1) + '. ' + (lang === 'ar' ? question.question : question.questionEn) + '</h5>';

            question.options.forEach((option, oIndex) => {
                const optionText = lang === 'ar' ? option : question.optionsEn[oIndex];
                html += '<div class="quiz-option" onclick="quizManager.selectMCQOption(' + qIndex + ', ' + oIndex + ')"><input type="radio" name="mcq-' + qIndex + '" value="' + oIndex + '"><span>' + optionText + '</span></div>';
            });

            html += '</div>';
        });

        container.innerHTML = html;
    }

    renderTrueFalse() {
        const container = document.getElementById('tf-container');
        if (!this.quizData || !this.quizData.trueFalse) {
            container.innerHTML = '';
            return;
        }

        let html = '';
        const lang = this.currentLanguage;

        this.quizData.trueFalse.forEach((question, qIndex) => {
            html += '<div class="true-false-question" data-question="' + qIndex + '"><h5>' +
                (qIndex + 1) + '. ' + (lang === 'ar' ? question.question : question.questionEn) +
                '</h5><div class="true-false-buttons"><button class="tf-btn" onclick="quizManager.selectTFOption(' + qIndex + ', true)">' +
                (lang === 'ar' ? 'صح' : 'True') +
                '</button><button class="tf-btn" onclick="quizManager.selectTFOption(' + qIndex + ', false)">' +
                (lang === 'ar' ? 'خطأ' : 'False') +
                '</button></div></div>';
        });

        container.innerHTML = html;
    }

    selectMCQOption(questionIndex, optionIndex) {
        this.userAnswers.mcq[questionIndex] = parseInt(optionIndex);
        const questionDiv = document.querySelector('#mcq-container .quiz-question[data-question="' + questionIndex + '"]');
        questionDiv.querySelectorAll('.quiz-option').forEach(opt => opt.classList.remove('selected'));
        questionDiv.querySelectorAll('.quiz-option')[optionIndex].classList.add('selected');
        questionDiv.querySelectorAll('input[type="radio"]')[optionIndex].checked = true;
    }

    selectTFOption(questionIndex, value) {
        this.userAnswers.trueFalse[questionIndex] = value;
        const questionDiv = document.querySelector('#tf-container .true-false-question[data-question="' + questionIndex + '"]');
        questionDiv.querySelectorAll('.tf-btn').forEach(btn => btn.classList.remove('selected'));
        questionDiv.querySelectorAll('.tf-btn')[value ? 0 : 1].classList.add('selected');
    }

    checkAnswers() {
        let correctMCQ = 0;
        let correctTF = 0;
        let totalMCQ = this.quizData.mcq ? this.quizData.mcq.length : 0;
        let totalTF = this.quizData.trueFalse ? this.quizData.trueFalse.length : 0;

        if (this.quizData.mcq) {
            this.quizData.mcq.forEach((question, qIndex) => {
                const userAnswer = this.userAnswers.mcq[qIndex];
                const correctAnswer = question.correct;
                const questionDiv = document.querySelector('#mcq-container .quiz-question[data-question="' + qIndex + '"]');

                questionDiv.querySelectorAll('.quiz-option').forEach((opt, idx) => {
                    opt.classList.remove('correct', 'incorrect');
                    if (userAnswer !== undefined) {
                        if (idx === correctAnswer) {
                            opt.classList.add('correct');
                        }
                        if (idx === userAnswer && userAnswer !== correctAnswer) {
                            opt.classList.add('incorrect');
                        }
                    }
                });

                if (userAnswer === correctAnswer) {
                    correctMCQ++;
                }
            });
        }

        if (this.quizData.trueFalse) {
            this.quizData.trueFalse.forEach((question, qIndex) => {
                const userAnswer = this.userAnswers.trueFalse[qIndex];
                const correctAnswer = question.correct;
                const questionDiv = document.querySelector('#tf-container .true-false-question[data-question="' + qIndex + '"]');

                questionDiv.querySelectorAll('.tf-btn').forEach((btn, idx) => {
                    btn.classList.remove('correct', 'incorrect');
                    const btnValue = idx === 0;
                    if (userAnswer !== undefined) {
                        if (btnValue === correctAnswer) {
                            btn.classList.add('correct');
                        }
                        if (btnValue === userAnswer && userAnswer !== correctAnswer) {
                            btn.classList.add('incorrect');
                        }
                    }
                });

                if (userAnswer === correctAnswer) {
                    correctTF++;
                }
            });
        }

        this.displayResults(correctMCQ + correctTF, totalMCQ + totalTF);
    }

    displayResults(correct, total) {
        const resultsDiv = document.getElementById('quizResults');
        const scoreText = document.getElementById('scoreText');
        const gradeText = document.getElementById('gradeText');

        const percentage = (correct / total) * 100;
        let grade, gradeClass, message;

        if (percentage >= 90) {
            grade = 'A';
            gradeClass = 'grade-a';
            message = this.currentLanguage === 'ar' ? 'ممتاز!' : 'Excellent!';
        } else if (percentage >= 80) {
            grade = 'B';
            gradeClass = 'grade-b';
            message = this.currentLanguage === 'ar' ? 'جيد جداً!' : 'Very Good!';
        } else if (percentage >= 70) {
            grade = 'C';
            gradeClass = 'grade-c';
            message = this.currentLanguage === 'ar' ? 'جيد' : 'Good';
        } else if (percentage >= 60) {
            grade = 'D';
            gradeClass = 'grade-d';
            message = this.currentLanguage === 'ar' ? 'مقبول' : 'Pass';
        } else {
            grade = 'F';
            gradeClass = 'grade-f';
            message = this.currentLanguage === 'ar' ? 'يحتاج تحسين' : 'Needs Improvement';
        }

        scoreText.textContent = this.currentLanguage === 'ar'
            ? 'النتيجة: ' + correct + '/' + total
            : 'Score: ' + correct + '/' + total;
        gradeText.innerHTML = '<span class="' + gradeClass + '">' + message + ' (' + grade + ')</span>';
        resultsDiv.style.display = 'block';
    }

    resetQuiz() {
        this.userAnswers = {
            mcq: {},
            trueFalse: {}
        };
        document.querySelectorAll('.quiz-option').forEach(opt => {
            opt.classList.remove('selected', 'correct', 'incorrect');
        });
        document.querySelectorAll('.tf-btn').forEach(btn => {
            btn.classList.remove('selected', 'correct', 'incorrect');
        });
        document.querySelectorAll('input[type="radio"]').forEach(radio => {
            radio.checked = false;
        });
        document.getElementById('quizResults').style.display = 'none';
    }

    toggleLanguage() {
        this.currentLanguage = this.currentLanguage === 'ar' ? 'en' : 'ar';
        this.renderQuiz();
        return this.currentLanguage;
    }
}
