import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MarketCapChart extends StatelessWidget {
  const MarketCapChart({super.key});

  // Data model for market cap
  final List<Map<String, dynamic>> data = const [
    {
      "year": 2018,
      "values": [
        {"name": "North America", "value": 39.0, "color": Color(0xFF1A237E)},
        {"name": "Greater China", "value": 11.0, "color": Color(0xFF283593)},
        {"name": "Europe", "value": 16.0, "color": Color(0xFF3949AB)},
        {"name": "Asia", "value": 15.0, "color": Color(0xFF5C6BC0)},
        {"name": "Africa & Middle East", "value": 12.0, "color": Color(0xFF9FA8DA)},
        {"name": "Latin America & Caribbean", "value": 10.0, "color": Color(0xFFC5CAE9)}
      ]
    },
    {
      "year": 2019,
      "values": [
        {"name": "North America", "value": 39.0, "color": Color(0xFF1A237E)},
        {"name": "Greater China", "value": 16.0, "color": Color(0xFF283593)},
        {"name": "Europe", "value": 17.0, "color": Color(0xFF3949AB)},
        {"name": "Asia", "value": 19.0, "color": Color(0xFF5C6BC0)},
        {"name": "Africa & Middle East", "value": 16.0, "color": Color(0xFF9FA8DA)},
        {"name": "Latin America & Caribbean", "value": 12.0, "color": Color(0xFFC5CAE9)}
      ]
    },
    {
      "year": 2020,
      "values": [
        {"name": "North America", "value": 50.0, "color": Color(0xFF1A237E)},
        {"name": "Greater China", "value": 16.0, "color": Color(0xFF283593)},
        {"name": "Europe", "value": 17.0, "color": Color(0xFF3949AB)},
        {"name": "Asia", "value": 17.0, "color": Color(0xFF5C6BC0)},
        {"name": "Africa & Middle East", "value": 19.0, "color": Color(0xFF9FA8DA)},
        {"name": "Latin America & Caribbean", "value": 13.0, "color": Color(0xFFC5CAE9)}
      ]
    },
    {
      "year": 2021,
      "values": [
        {"name": "North America", "value": 39.0, "color": Color(0xFF1A237E)},
        {"name": "Greater China", "value": 13.0, "color": Color(0xFF283593)},
        {"name": "Europe", "value": 15.0, "color": Color(0xFF3949AB)},
        {"name": "Asia", "value": 16.0, "color": Color(0xFF5C6BC0)},
        {"name": "Africa & Middle East", "value": 17.0, "color": Color(0xFF9FA8DA)},
        {"name": "Latin America & Caribbean", "value": 12.0, "color": Color(0xFFC5CAE9)}
      ]
    },
    {
      "year": 2022,
      "values": [
        {"name": "North America", "value": 43.0, "color": Color(0xFF1A237E)},
        {"name": "Greater China", "value": 13.0, "color": Color(0xFF283593)},
        {"name": "Europe", "value": 15.0, "color": Color(0xFF3949AB)},
        {"name": "Asia", "value": 12.0, "color": Color(0xFF5C6BC0)},
        {"name": "Africa & Middle East", "value": 15.0, "color": Color(0xFF9FA8DA)},
        {"name": "Latin America & Caribbean", "value": 13.0, "color": Color(0xFFC5CAE9)}
      ]
    },
    {
      "year": 2023,
      "values": [
        {"name": "North America", "value": 43.0, "color": Color(0xFF1A237E)},
        {"name": "Greater China", "value": 13.0, "color": Color(0xFF283593)},
        {"name": "Europe", "value": 15.0, "color": Color(0xFF3949AB)},
        {"name": "Asia", "value": 12.0, "color": Color(0xFF5C6BC0)},
        {"name": "Africa & Middle East", "value": 15.0, "color": Color(0xFF9FA8DA)},
        {"name": "Latin America & Caribbean", "value": 13.0, "color": Color(0xFFC5CAE9)}
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Global Market Capitalization'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Total global market capitalization in 2023 stands at ~\$89 trillion',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Global stock market breakdown by region, 2007 – 2023 in \$ trillion',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceEvenly,
                  maxY: 120,
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    horizontalInterval: 20,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: Colors.grey.shade200,
                        strokeWidth: 1,
                      );
                    },
                  ),
                  barTouchData: BarTouchData(
                    enabled: true,
                    touchTooltipData: BarTouchTooltipData(

                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        final value = rod.toY - rod.fromY;
                        return BarTooltipItem(
                          '\$${value.toStringAsFixed(1)}T',
                          const TextStyle(color: Colors.white),
                        );
                      },
                    ),
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          if (value < 0 || value >= data.length) {
                            return const SizedBox.shrink();
                          }
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              data[value.toInt()]["year"].toString(),
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                        reservedSize: 40,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 56,
                        interval: 20,
                        getTitlesWidget: (value, meta) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(
                              '\$${value.toInt()}T',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: List.generate(data.length, (index) {
                    double cumulative = 0;
                    final yearData = data[index]["values"] as List;

                    return BarChartGroupData(
                      x: index,
                      barRods: [
                        BarChartRodData(
                          fromY: 0,
                          toY: yearData.fold(0.0, (sum, item) => sum + (item["value"] as double)),
                          width: 40,
                          rodStackItems: yearData.map((region) {
                            final value = region["value"] as double;
                            final startY = cumulative;
                            cumulative += value;
                            return BarChartRodStackItem(
                              startY,
                              cumulative,
                              region["color"] as Color,
                              BorderSide.none,
                            );
                          }).toList(),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildLegend(),
          ],
        ),
      ),
    );
  }

  Widget _buildLegend() {
    // Get the first year's data for legend (colors and names are consistent)
    final legendItems = (data[0]["values"] as List).cast<Map<String, dynamic>>();

    return Wrap(
      spacing: 16,
      runSpacing: 8,
      children: legendItems.map((item) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 16,
              height: 16,
              color: item["color"] as Color,
            ),
            const SizedBox(width: 4),
            Text(
              item["name"] as String,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        );
      }).toList(),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Market Cap Chart',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MarketCapChart(),
    );
  }
}