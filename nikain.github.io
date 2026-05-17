<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agro-Product Tech: Derivative Applications</title>
    <!-- Tailwind CSS for clean, modern styling -->
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <!-- Chart.js for the interactive graph -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
    </style>
</head>
<body class="bg-slate-50 text-slate-800 min-h-screen p-6">

    <div class="max-w-5xl mx-auto bg-white rounded-2xl shadow-xl overflow-hidden border border-slate-100">
        
        <!-- Header Section -->
        <header class="bg-gradient-to-r from-emerald-600 to-teal-700 text-white p-6 shadow-md">
            <span class="text-xs font-bold uppercase tracking-widest bg-emerald-500/30 px-3 py-1 rounded-full text-emerald-100">
                SFP: Agro Product Technology
            </span>
            <h1 class="text-3xl font-extrabold mt-2">Enzymatic Extraction Optimization of Malaysian Roselle</h1>
            <p class="text-emerald-100 mt-1 text-sm sm:text-base">
                Using Calculus to Determine Peak Bioactive Yield Rates in Food Processing.
            </p>
        </header>

        <div class="p-6 space-y-8">
            
            <!-- Bioscience Problem & Data Sources -->
            <section class="grid md:grid-cols-2 gap-6">
                <div class="bg-slate-50 p-5 rounded-xl border border-slate-200">
                    <h2 class="text-lg font-bold text-emerald-800 mb-2">🌿 The Bioscience Problem</h2>
                    <p class="text-sm text-slate-600 leading-relaxed">
                        During the industrial processing of local **Roselle (*Hibiscus sabdariffa*)**, pectinase enzymes are used to break down plant cell walls to extract antioxidant-rich polyphenols. 
                        To minimize energy costs and prevent the heat-induced degradation of delicate vitamins, agro-product technologists must find the exact time when the <strong>rate of extraction begins to slow down (diminishing returns)</strong>.
                    </p>
                </div>
                <div class="bg-slate-50 p-5 rounded-xl border border-slate-200 flex flex-col justify-between">
                    <div>
                        <h2 class="text-lg font-bold text-slate-700 mb-2">📊 Mathematical Modeling</h2>
                        <p class="text-sm text-slate-600">
                            Based on empirical kinetic data from Malaysian agro-waste literature, the total yield $Y$ (mg/g) over time $t$ (hours) is modeled by a cubic polynomial:
                        </p>
                        <!-- Mathematical Formula Expressions -->
                        <div class="my-3 p-3 bg-white rounded border border-slate-100 font-mono text-xs space-y-1">
                            <div class="text-emerald-700 font-bold">Yield Function:</div>
                            <div>f(t) = -2.2t³ + 15.5t² + 12t</div>
                            <div class="text-amber-700 font-bold mt-2">Rate of Change (Derivative):</div>
                            <div>f'(t) = -6.6t² + 31t + 12</div>
                        </div>
                    </div>
                    <div class="text-xs text-slate-400 mt-2 italic">
                        Data adaptation framework inspired by: <i>MARDI Food Technology Research Journal</i> & <i>Malaysian Journal of Analytical Sciences</i>.
                    </div>
                </div>
            </section>

            <hr class="border-slate-200">

            <!-- Interactive Chart Area -->
            <section class="space-y-4">
                <div class="flex flex-col sm:flex-row justify-between items-start sm:items-center">
                    <div>
                        <h2 class="text-xl font-bold text-slate-800">Kinetic Yield Curve</h2>
                        <p class="text-xs text-amber-600 font-medium">💡 Click anywhere on the blue line to calculate the derivative at that exact hour!</p>
                    </div>
                    <div id="status-badge" class="mt-2 sm:mt-0 text-xs font-semibold bg-blue-50 text-blue-700 px-3 py-1.5 rounded-md border border-blue-200 animate-pulse">
                        Waiting for user click...
                    </div>
                </div>

                <!-- Canvas for Chart.js -->
                <div class="relative w-full h-[350px] bg-slate-900 rounded-xl p-4 shadow-inner">
                    <canvas id="yieldChart"></canvas>
                </div>
            </section>

            <!-- Dynamic Result Output Panel -->
            <section id="result-panel" class="hidden bg-gradient-to-r from-slate-900 to-slate-800 text-white p-6 rounded-xl border-l-4 border-amber-500 shadow-md transform transition-all duration-300">
                <div class="grid sm:grid-cols-3 gap-4">
                    <div class="border-r border-slate-700 pr-4">
                        <span class="text-xs text-slate-400 uppercase tracking-wider block">Selected Time (t)</span>
                        <span id="res-time" class="text-2xl font-bold text-amber-400">0.0</span> <span class="text-xs">hours</span>
                    </div>
                    <div class="border-r border-slate-700 pr-4">
                        <span class="text-xs text-slate-400 uppercase tracking-wider block">Current Total Yield f(t)</span>
                        <span id="res-yield" class="text-2xl font-bold text-emerald-400">0.0</span> <span class="text-xs">mg/g</span>
                    </div>
                    <div>
                        <span class="text-xs text-slate-400 uppercase tracking-wider block">Extraction Rate f'(t)</span>
                        <span id="res-rate" class="text-2xl font-bold text-cyan-400">0.0</span> <span class="text-xs">mg/g per hr</span>
                    </div>
                </div>
                <div class="mt-4 pt-4 border-t border-slate-700/60">
                    <h4 class="text-xs font-bold text-amber-400 uppercase tracking-wider">What this means for an Agro-Product Developer:</h4>
                    <p id="res-explain" class="text-sm text-slate-300 mt-1 leading-relaxed">
                        Click on the graph line to parse calculus into actionable bio-processing decisions.
                    </p>
                </div>
            </section>

        </div>

        <footer class="bg-slate-100 text-center py-4 text-xs text-slate-500 border-t border-slate-200">
            Designed for Agro Product Technology Curriculum Integration • Driven by Calculus & Chart.js
        </footer>
    </div>

    <script>
        // Mathematical Functions
        // f(t) = -2.2t^3 + 15.5t^2 + 12t
        function calculateYield(t) {
            return (-2.2 * Math.pow(t, 3)) + (15.5 * Math.pow(t, 2)) + (12 * t);
        }

        // f'(t) = -6.6t^2 + 31t + 12
        function calculateDerivative(t) {
            return (-6.6 * Math.pow(t, 2)) + (31 * t) + 12;
        }

        // Generate data points for the 0 to 6 hour extraction cycle
        const timeLabels = [];
        const yieldData = [];
        for (let t = 0; t <= 6; t += 0.25) {
            timeLabels.push(t.toFixed(2));
            yieldData.push(calculateYield(t).toFixed(2));
        }

        // Initialize Chart.js
        const ctx = document.getElementById('yieldChart').getContext('2d');
        const yieldChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: timeLabels,
                datasets: [{
                    label: 'Total Polyphenol Yield (mg/g)',
                    data: yieldData,
                    borderColor: '#10b981', // Emerald
                    borderWidth: 3,
                    backgroundColor: 'rgba(16, 185, 129, 0.1)',
                    fill: true,
                    tension: 0.3,
                    pointBackgroundColor: '#f59e0b', // Amber points
                    pointRadius: 2,
                    pointHoverRadius: 8,
                    pointHoverBackgroundColor: '#3b82f6' // Blue hover point
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        labels: { color: '#f8fafc' }
                    },
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                return `Yield: ${context.parsed.y} mg/g (Click to view f'(x))`;
                            }
                        }
                    }
                },
                scales: {
                    x: {
                        title: { display: true, text: 'Extraction Time (Hours)', color: '#94a3b8' },
                        grid: { color: '#334155' },
                        ticks: { color: '#f8fafc' }
                    },
                    y: {
                        title: { display: true, text: 'Polyphenol Yield (mg/g)', color: '#94a3b8' },
                        grid: { color: '#334155' },
                        ticks: { color: '#f8fafc' },
                        min: 0
                    }
                },
                // Trigger action when a user clicks anywhere on the chart
                onClick: (e, elements) => {
                    if (elements.length > 0) {
                        const index = elements[0].index;
                        const t = parseFloat(timeLabels[index]);
                        handleDataAnalysis(t);
                    }
                },
                // Quick entry animation smoothly shifts the curve upwards
                animation: {
                    duration: 2000,
                    easing: 'easeOutQuart'
                }
            }
        });

        // Handle calculations and layman analysis updates
        function handleDataAnalysis(t) {
            const yieldVal = calculateYield(t);
            const derivativeVal = calculateDerivative(t);

            // Update UI Numbers
            document.getElementById('res-time').innerText = t.toFixed(2);
            document.getElementById('res-yield').innerText = yieldVal.toFixed(2);
            document.getElementById('res-rate').innerText = derivativeVal.toFixed(2);
            
            // UI Visual Updates
            document.getElementById('status-badge').innerText = `Analysis Active: t = ${t} hrs`;
            document.getElementById('status-badge').className = "mt-2 sm:mt-0 text-xs font-semibold bg-amber-50 text-amber-700 px-3 py-1.5 rounded-md border border-amber-200";
            
            const panel = document.getElementById('result-panel');
            panel.classList.remove('hidden');

            // Generate Layman Explanation based on derivative status
            let explanation = "";
            if (t === 0) {
                explanation = `At the absolute beginning (0 hours), your extraction rate is strong at ${derivativeVal.toFixed(2)} mg/g per hour as the enzymes first make contact with the Roselle material.`;
            } else if (derivativeVal > 15) {
                explanation = `The derivative f'(t) is highly positive (${derivativeVal.toFixed(2)}). This means the enzymes are aggressively breaking down the tissues and the yield is shooting up fast. Keep the extraction process running!`;
            } else if (derivativeVal > 0 && derivativeVal <= 15) {
                explanation = `The rate of extraction f'(t) is slowing down to ${derivativeVal.toFixed(2)} mg/g per hour. Even though your total yield is still slightly increasing, the speed is tapering off because the substrate is depleted. Prepare to stop the batch soon.`;
            } else {
                explanation = `The derivative f'(t) has gone negative (${derivativeVal.toFixed(2)})! The yield is actually dropping. In a production environment, this means you have over-processed the Roselle, and the target antioxidants are now degrading due to prolonged enzymatic/heat exposure. Stop much earlier next time!`;
            }

            document.getElementById('res-explain').innerHTML = explanation;
        }
    </script>
</body>
</html>
