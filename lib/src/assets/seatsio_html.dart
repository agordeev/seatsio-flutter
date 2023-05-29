final String seatsioHTML = """
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://cdn-%region%.seatsio.net/chart.js" type="text/javascript"></script>
  </head>
    <body style="margin: 0; padding: 0;">
      <div id="chart" style="width: 100%; height: 100%; background-color: #333333"></div>
      <script>
        let chart = new seatsio.SeatingChart(%configAsJs%).render()

        // [begin] Bridge some functions of Seatsio 
        
        function listCategories(data, callback) {
            chart.listCategories(categories => callback(JSON.stringify(categories)));
        }

        function changeConfig(data, callback) {
            chart.changeConfig(JSON.parse(data))
            callback(data)
        }

        // [end]

        // Register channel to post message to Flutter.
        function postMessageToFlutter(jsonString) {
          FlutterJsBridge.postMessage(jsonString);
        }

      </script>
  </body>
</html>
""";
