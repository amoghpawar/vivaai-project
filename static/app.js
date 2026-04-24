let qid = null;
let lastWeakQid = null;
let weakStreak = 0;
let sessionResults = [];
let questionCount = 0;
let hintUsed = false;
const MAX_QUESTIONS = 5;

function loadQuestion(q) {
    qid = q.id;
    hintUsed = false;
    document.getElementById("question-text").innerText = q.question_text;
    document.getElementById("meta").innerText = "Subject: " + q.subject + "  |  Topic: " + q.topic + "  |  Difficulty: " + q.difficulty;
    document.getElementById("answer").value = "";
    document.getElementById("answer").focus();
    document.getElementById("result").style.display = "none";
    document.getElementById("result").innerHTML = "";
    document.getElementById("hint-box").style.display = "none";
    document.getElementById("hint-text").innerText = "";
    document.getElementById("hint-btn").disabled = false;
    document.getElementById("hint-btn").innerText = "💡 Hint (-10%)";

    // Progress bar
    const pct = (questionCount / MAX_QUESTIONS) * 100;
    document.getElementById("progress").style.width = pct + "%";
    document.getElementById("q-counter").innerText = "Question " + (questionCount + 1) + " of " + MAX_QUESTIONS;

    const skipBtn = document.getElementById("skip-btn");
    if (lastWeakQid === qid) {
        weakStreak++;
        skipBtn.style.display = "inline-block";
    } else {
        weakStreak = 0;
        lastWeakQid = null;
        skipBtn.style.display = "none";
    }
}

window.onload = function () {
    fetch("/question")
        .then(res => {
            if (!res.ok) throw new Error("Server error: " + res.status);
            return res.json();
        })
        .then(data => {
            if (!data || !data.id) {
                document.getElementById("question-text").innerText = "No questions found. Please import the SQL file.";
                return;
            }
            loadQuestion(data);
        })
        .catch(err => {
            document.getElementById("question-text").innerText = "Error loading question. Please logout and login again.";
            console.error(err);
        });
};

async function getHint() {
    hintUsed = true;
    document.getElementById("hint-btn").disabled = true;
    document.getElementById("hint-btn").innerText = "💡 Hint Used";
    const res = await fetch("/hint", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ question_id: qid })
    });
    const data = await res.json();
    document.getElementById("hint-text").innerText = data.hint;
    document.getElementById("hint-box").style.display = "block";
}

function submitAnswer() {
    let ans = document.getElementById("answer").value.trim();
    if (ans === "") { alert("Please enter an answer."); return; }
    if (isRecording && recognition) { recognition.stop(); }

    const resultBox = document.getElementById("result");
    resultBox.style.display = "block";
    resultBox.innerHTML = "⏳ Evaluating...";
    document.querySelector("button[onclick='submitAnswer()']").disabled = true;

    fetch("/submit_answer", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ question_id: qid, answer: ans, hint_used: hintUsed })
    })
    .then(res => res.json())
    .then(data => {
        const colors = { Strong: "#4ade80", Average: "#fb923c", Weak: "#f87171" };
        const pct = (data.score * 100).toFixed(1);

        sessionResults.push({
            question: document.getElementById("question-text").innerText,
            topic: document.getElementById("meta").innerText,
            answer: ans,
            score: data.score,
            classification: data.classification,
            hintUsed: hintUsed
        });
        questionCount++;

        if (data.classification === "Weak" && data.next_question) {
            lastWeakQid = data.next_question.id;
        } else {
            lastWeakQid = null;
            weakStreak = 0;
        }

        const hintNote = hintUsed ? " <small style='color:#c4b5fd'>(hint used -10%)</small>" : "";
        resultBox.innerHTML =
            "<b>Score:</b> " + pct + "%" + hintNote + " &nbsp;|&nbsp; " +
            "<b>Grade:</b> <span style='color:" + colors[data.classification] + ";font-weight:bold'>" +
            data.classification + "</span>" +
            "<br><small style='color:#aaa'>Next question in 2 seconds...</small>";

        document.querySelector("button[onclick='submitAnswer()']").disabled = false;

        setTimeout(() => {
            if (questionCount >= MAX_QUESTIONS || !data.next_question) {
                showAnalysis();
            } else {
                loadQuestion(data.next_question);
            }
        }, 2000);
    })
    .catch(() => {
        resultBox.innerHTML = "❌ Error connecting to server.";
        document.querySelector("button[onclick='submitAnswer()']").disabled = false;
    });
}

function skipQuestion() {
    weakStreak = 0;
    lastWeakQid = null;
    document.getElementById("skip-btn").style.display = "none";
    document.getElementById("result").style.display = "none";
    document.getElementById("answer").value = "";
    document.getElementById("hint-box").style.display = "none";
    fetch("/question")
        .then(res => res.json())
        .then(data => loadQuestion(data));
}

function showAnalysis() {
    const strong = sessionResults.filter(r => r.classification === "Strong");
    const average = sessionResults.filter(r => r.classification === "Average");
    const weak = sessionResults.filter(r => r.classification === "Weak");
    const avgScore = sessionResults.reduce((a, b) => a + b.score, 0) / sessionResults.length;

    let overallMsg = "", overallColor = "";
    if (avgScore >= 0.55) {
        overallMsg = "🏆 Excellent! You have a strong grasp of the subject. Ready to crack interviews!";
        overallColor = "#4ade80";
    } else if (avgScore >= 0.30) {
        overallMsg = "📚 Good Effort! Review the average and weak topics to improve further.";
        overallColor = "#fb923c";
    } else {
        overallMsg = "💪 Keep Practicing! Focus on the weak topics listed below and try again.";
        overallColor = "#f87171";
    }

    let html = `
        <div style="text-align:center;margin-bottom:1.5rem">
            <h2 style="color:#7eb8f7;font-size:1.4rem">📊 Viva Analysis Report</h2>
            <p style="color:${overallColor};font-size:1rem;margin-top:0.5rem;font-weight:bold">${overallMsg}</p>
            <div style="display:flex;justify-content:center;gap:1.5rem;margin-top:0.75rem;flex-wrap:wrap">
                <span>Overall: <b style="color:#fff">${(avgScore*100).toFixed(1)}%</b></span>
                <span style="color:#4ade80">✅ Strong: ${strong.length}</span>
                <span style="color:#fb923c">🟠 Average: ${average.length}</span>
                <span style="color:#f87171">❌ Weak: ${weak.length}</span>
            </div>
        </div>`;

    html += `<h3 style="color:#7eb8f7;margin-bottom:0.75rem">📋 Question Breakdown</h3>`;
    sessionResults.forEach((r, i) => {
        const colors = { Strong: "#4ade80", Average: "#fb923c", Weak: "#f87171" };
        const icons = { Strong: "✅", Average: "🟠", Weak: "❌" };
        const hintBadge = r.hintUsed ? " <span style='color:#c4b5fd;font-size:0.75rem'>[hint used]</span>" : "";
        html += `
        <div style="background:#111;padding:0.75rem;border-radius:8px;margin-bottom:0.5rem;border-left:3px solid ${colors[r.classification]}">
            <b style="color:#fff">Q${i+1}:</b> ${r.question}<br>
            <small style="color:#aaa">Your answer: ${r.answer}</small><br>
            <small>${icons[r.classification]} <b style="color:${colors[r.classification]}">${r.classification}</b> — Score: ${(r.score*100).toFixed(1)}%${hintBadge}</small>
        </div>`;
    });

    html += `<h3 style="color:#7eb8f7;margin:1rem 0 0.75rem">🎯 Study Recommendations</h3>`;

    if (weak.length > 0) {
        html += `<div style="background:#2a1a1a;padding:0.75rem;border-radius:8px;margin-bottom:0.5rem;border-left:3px solid #f87171">
            <b style="color:#f87171">❌ Must Revise (Weak):</b><br>`;
        weak.forEach(r => { html += `<small style="color:#eee">• <b>${r.question}</b> — Study this topic from basics</small><br>`; });
        html += `</div>`;
    }
    if (average.length > 0) {
        html += `<div style="background:#2a1f1a;padding:0.75rem;border-radius:8px;margin-bottom:0.5rem;border-left:3px solid #fb923c">
            <b style="color:#fb923c">🟠 Can Improve (Average):</b><br>`;
        average.forEach(r => { html += `<small style="color:#eee">• <b>${r.question}</b> — Practice with examples</small><br>`; });
        html += `</div>`;
    }
    if (strong.length > 0) {
        html += `<div style="background:#1a2a1a;padding:0.75rem;border-radius:8px;margin-bottom:0.5rem;border-left:3px solid #4ade80">
            <b style="color:#4ade80">✅ Well Done (Strong):</b><br>`;
        strong.forEach(r => { html += `<small style="color:#eee">• <b>${r.question}</b> — Great answer!</small><br>`; });
        html += `</div>`;
    }

    html += `
        <div style="display:flex;gap:0.75rem;margin-top:1.5rem;flex-wrap:wrap">
            <button onclick="restartViva()" style="flex:1;padding:0.8rem;font-size:1rem;background:#3a86ff">🔄 Try Again</button>
            <button onclick="window.location='/subject'" style="flex:1;padding:0.8rem;font-size:1rem;background:#555">🔀 Change Subject</button>
            <button onclick="saveAsPDF()" style="flex:1;padding:0.8rem;font-size:1rem;background:#16a34a">📄 Save as PDF</button>
        </div>`;

    document.querySelector(".card").innerHTML = html;
}

function saveAsPDF() {
    const card = document.querySelector(".card");
    const buttons = card.querySelector("div:last-child");

    // Hide buttons before printing
    buttons.style.display = "none";

    const printWindow = window.open("", "_blank");
    printWindow.document.write(`
        <!DOCTYPE html>
        <html>
        <head>
            <title>VivaAI Analysis Report</title>
            <style>
                body { font-family: 'Segoe UI', sans-serif; background: white; color: #111; padding: 2rem; max-width: 800px; margin: auto; }
                h2 { color: #1a1a6e; border-bottom: 2px solid #3a86ff; padding-bottom: 0.5rem; }
                h3 { color: #333; margin-top: 1.5rem; }
                div { margin-bottom: 0.5rem; }
                b { color: #111; }
                small { color: #444; }
                @media print {
                    body { padding: 0; }
                }
            </style>
        </head>
        <body>
            ${card.innerHTML}
        </body>
        </html>
    `);
    printWindow.document.close();

    // Show buttons again
    buttons.style.display = "flex";

    printWindow.onload = function() {
        printWindow.focus();
        printWindow.print();
        printWindow.close();
    };
}

function restartViva() {
    sessionResults = [];
    questionCount = 0;
    lastWeakQid = null;
    weakStreak = 0;
    hintUsed = false;
    location.reload();
}

// Mic
let recognition = null;
let isRecording = false;

function startMic() {
    if (!("webkitSpeechRecognition" in window || "SpeechRecognition" in window)) {
        alert("Speech not supported. Use Google Chrome.");
        return;
    }
    if (isRecording && recognition) { recognition.stop(); return; }

    const Recognition = window.SpeechRecognition || window.webkitSpeechRecognition;
    recognition = new Recognition();
    recognition.lang = "en-US";
    recognition.continuous = false;
    recognition.interimResults = false;
    recognition.maxAlternatives = 1;
    isRecording = true;
    document.getElementById("recording").style.display = "block";
    document.getElementById("mic-btn").innerText = "⏹ Stop";

    let existingText = document.getElementById("answer").value;
    if (existingText && !existingText.endsWith(" ")) existingText += " ";

    recognition.start();
    recognition.onresult = (e) => {
        let interim = "", final = "";
        for (let i = e.resultIndex; i < e.results.length; i++) {
            if (e.results[i].isFinal) final += e.results[i][0].transcript + " ";
            else interim += e.results[i][0].transcript;
        }
        document.getElementById("answer").value = existingText + final + interim;
        if (final) existingText += final;
    };
    recognition.onend = () => {
        isRecording = false;
        document.getElementById("recording").style.display = "none";
        document.getElementById("mic-btn").innerText = "🎤 Speak";
    };
    recognition.onerror = (e) => {
        isRecording = false;
        document.getElementById("recording").style.display = "none";
        document.getElementById("mic-btn").innerText = "🎤 Speak";
        if (e.error !== "aborted") alert("Mic error: " + e.error);
    };
}
