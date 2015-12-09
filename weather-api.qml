// CS 422 Sping 13 Project 1
// Chihua Ma

import QtQuick 2.0

Rectangle {

    //width: 640; height: 400

    width: 960; height: 600
    transform: Scale {xScale: 1.5; yScale: 1.5}
    //width: 1120; height: 700
    //transform: Scale {xScale: 1.75; yScale: 1.75}

    gradient: Gradient {
             GradientStop { position: 0.0; color: "darkgrey" }
             GradientStop { position: 1.0; color: "lightgrey" }
    }

    Image {
        id: image0
        source: "images/background.jpg"
        width: 640
        height: 400
    }

     Component.onCompleted: {
         city_label.text = button1.text

         var doc = new XMLHttpRequest();
         doc.onreadystatechange = function() {
            if (doc.readyState == XMLHttpRequest.DONE) {
                var jsonObject = eval('(' + doc.responseText + ')');
                loaded(jsonObject,1);
             }
         }
         doc.open("GET", "http://free.worldweatheronline.com/feed/weather.ashx?q=" + city_label.text + "&format=json&num_of_days=5&key=223ff2583d012617131202");
         doc.send();

         var doc2 = new XMLHttpRequest();
         doc2.onreadystatechange = function() {
             if (doc2.readyState == XMLHttpRequest.DONE) {
                 var jsonObject2 = eval('(' + doc2.responseText + ')');
                 showRequestTime(jsonObject2.data.time_zone[0].localtime);
             }
         }
         doc2.open("GET", "http://free.worldweatheronline.com/feed/tz.ashx?q=" + city_label.text + "&format=json&num_of_days=5&key=223ff2583d012617131202");
         doc2.send();
     }

    // rect 1
    Rectangle {
        x: 120
        y: 50
        width: 400
        height: 140
        opacity: 0.6
        color: "#424242"
        border.color: "black"
        border.width: 2
        radius: 20
    }

    // rect 2
    Rectangle {
        x: 190
        y: 20
        width: 260
        height: 100
        color: "#151515"
        border.color: "black"
        border.width: 2
        radius: 20
    }

    // rect 3
    Rectangle {
        x: 120
        y: 220
        width: 400
        height: 60
        opacity: 0.6
        color: "#2E2E2E"
        border.color: "black"
        border.width: 2
        radius: 20
    }

    // rect 4
    Rectangle {
        x: 120
        y: 300
        width: 400
        height: 85
        opacity: 0.6
        color: "#1C1C1C"
        border.color: "black"
        border.width: 2
        radius: 20
    }

    /**************** Indoor *****************/
    // rect 5
    Rectangle {
        x: 540
        y: 52
        width: 85
        height: 135
        opacity: 0.6
        color: "#424242"
        border.color: "black"
        border.width: 2
        radius: 10
    }
    Text {
        id: indoor_EN
        x: 552
        y: 60
        text: "Indoor"
        color: "white"
        font.bold: true
        font.pointSize: 12
        style: Text.Raised
        styleColor: "black"
    }
    Text {
        id: indoor_SP
        visible: false
        x: 552
        y: 60
        text: "Interior"
        color: "white"
        font.bold: true
        font.pointSize: 12
        style: Text.Raised
        styleColor: "black"
     }
    Text {
        x: 552
        y: 95
        text: "78 F"
        color: "white"
        font.bold: true
        font.pointSize: 10
        style: Text.Raised
        styleColor: "black"
    }
    Text {
        id: indoor2_EN
        x: 550
        y: 125
        text: "Humidity"
        color: "white"
        font.bold: true
        font.pointSize: 10
        style: Text.Raised
        styleColor: "black"
    }
    Text {
        id: indoor2_SP
        visible: false
        x: 550
        y: 125
        text: "Humedad"
        color: "white"
        font.bold: true
        font.pointSize: 10
        style: Text.Raised
        styleColor: "black"
    }
    Text {
        x: 550
        y: 145
        text: "45%"
        color: "white"
        font.bold: true
        font.pointSize: 10
        style: Text.Raised
        styleColor: "black"
    }

    // setting
    Rectangle {
        id: settingPanel
        visible: false //hidden by default
        x: 550
        y: 225
        width: 70
        height: 120
        opacity: 0.6
        color: "#1C1C1C"
        border.color: "black"
        border.width: 2
        radius: 10
    }
    Text {
        x: 555
        y: 235
        id: log28;
        visible: false
        text: "Temperature"
        color: "white"
        font.bold: true
        font.pointSize: 7
        style: Text.Raised
        styleColor: "black"
    }
    Text {
            x: 555
            y: 235
            id: log28_SP;
            visible: false
            text: "Temperatura"
            color: "white"
            font.bold: true
            font.pointSize: 7
            style: Text.Raised
            styleColor: "black"
    }

    Image {
        id: temp_F
        visible: false
        x: 558
        y: 255
        width: 25
        height: 25
        source: "images/Fahrenheit.png"
        MouseArea {
            anchors.fill: parent
            onClicked: {

                var doc = new XMLHttpRequest();
                doc.onreadystatechange = function() {
                   if (doc.readyState == XMLHttpRequest.DONE) {
                       var jsonObject = eval('(' + doc.responseText + ')');
                       loaded(jsonObject,1);
                    }
                }
                doc.open("GET", "http://free.worldweatheronline.com/feed/weather.ashx?q=" + city_label.text + "&format=json&num_of_days=5&key=223ff2583d012617131202");
                doc.send();

                var doc2 = new XMLHttpRequest();
                         doc2.onreadystatechange = function() {
                             if (doc2.readyState == XMLHttpRequest.DONE) {
                                 var jsonObject2 = eval('(' + doc2.responseText + ')');
                                 showRequestTime(jsonObject2.data.time_zone[0].localtime);
                             }
                         }
                         doc2.open("GET", "http://free.worldweatheronline.com/feed/tz.ashx?q=" + city_label.text + "&format=json&num_of_days=5&key=223ff2583d012617131202");
                         doc2.send();
            }
        }
    }
    Image {
        id: temp_C
        visible: false
        x: 588
        y: 255
        width: 25
        height: 25
        source: "images/Celsius.png"
        MouseArea {
            anchors.fill: parent
            onClicked: {

                var doc = new XMLHttpRequest();
                doc.onreadystatechange = function() {
                   if (doc.readyState == XMLHttpRequest.DONE) {
                       var jsonObject = eval('(' + doc.responseText + ')');
                       loaded(jsonObject,0);
                    }
                }
                doc.open("GET", "http://free.worldweatheronline.com/feed/weather.ashx?q=" + city_label.text + "&format=json&num_of_days=5&key=223ff2583d012617131202");
                doc.send();

                var doc2 = new XMLHttpRequest();
                         doc2.onreadystatechange = function() {
                             if (doc2.readyState == XMLHttpRequest.DONE) {
                                 var jsonObject2 = eval('(' + doc2.responseText + ')');
                                 showRequestTime(jsonObject2.data.time_zone[0].localtime);
                             }
                         }
                         doc2.open("GET", "http://free.worldweatheronline.com/feed/tz.ashx?q=" + city_label.text + "&format=json&num_of_days=5&key=223ff2583d012617131202");
                         doc2.send();
            }
        }
    }

    Text {
        x: 553+5
        y: 293
        id: log29;
        visible: false
        text: "Languages"
        color: "white"
        font.bold: true
        font.pointSize: 7
        style: Text.Raised
        styleColor: "black"
    }
    Text {
        x: 553+5
        y: 293
        id: log29_SP;
        visible: false
        text: "Lenguas"
        color: "white"
        font.bold: true
        font.pointSize: 7
        style: Text.Raised
        styleColor: "black"
    }
    Image {
        id: english
        visible: false
        x: 553+5
        y: 310
        width: 25
        height: 25
        source: "images/united_states_of_america_usa.png"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                precipMM_SP.visible = false;
                humidity_SP.visible = false;
                pressure_SP.visible = false;
                visibility_SP.visible = false;
                indoor_SP.visible = false;
                indoor2_SP.visible = false;
                log28_SP.visible = false;
                log29_SP.visible = false;

                precipMM_EN.visible = true;
                humidity_EN.visible = true;
                pressure_EN.visible = true;
                visibility_EN.visible = true;
                indoor_EN.visible = true;
                indoor2_EN.visible = true;
                log28.visible = true;
                log29.visible = true;
            }
        }
    }
    Image {
        id: chinese
        visible: false
        x: 582+5
        y: 310
        width: 25
        height: 25
        source: "images/spain.png"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                precipMM_EN.visible = false;
                humidity_EN.visible = false;
                pressure_EN.visible = false;
                visibility_EN.visible = false;
                indoor_EN.visible = false;
                indoor2_EN.visible = false;
                log28.visible = false;
                log29.visible = false;

                precipMM_SP.visible = true;
                humidity_SP.visible = true;
                pressure_SP.visible = true;
                visibility_SP.visible = true;
                indoor_SP.visible = true;
                indoor2_SP.visible = true;
                log28_SP.visible = true;
                log29_SP.visible = true;
            }
        }
    }

    Image {
        id: setting
        source: "images/settings.png"
        x: 585+5
        y: 355
        width: 25
        height: 25

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onClicked: {

                if (setting.state == 'clicked') {
                    setting.state = "";
                    settingPanel.visible = false
                    log28.visible = false;
                    log28_SP.visible = false;
                    temp_F.visible = false
                    temp_C.visible = false
                    log29.visible = false;
                    log29_SP.visible = false;
                    english.visible = false;
                    chinese.visible = false;
                }
                else {
                    setting.state = 'clicked';
                    settingPanel.visible = true
                    log28.visible = true;
                    log28_SP.visible = true;
                    temp_F.visible = true
                    temp_C.visible = true
                    log29.visible = true;
                    log29_SP.visible = true;
                    english.visible = true;
                    chinese.visible = true;
                }
            }
        }
        states: [
            State {
                name: "clicked"
                //PropertyChanges { target: alert; color: "red" }
            }
        ]
    }

    /****************** Add Location ****************/
    // add
    Image {
        id: add
        source: "images/list_add.png"
        x: 20
        y: 355
        width: 25
        height: 25

        MouseArea {
            //id: addLocation
            anchors.fill: parent
            onClicked: {
                if (add.state == 'clicked') {
                    add.state = "";
                    addLocation.visible = false;
                    addTitle.visible = false;
                    enter.visible = false;
                    addCity.visible = false;
                }
                else {
                    add.state = 'clicked';
                    addLocation.visible = true;
                    addTitle.visible = true;
                    enter.visible = true;
                    addCity.visible = true;
                }
            }
        }
        states: [
            State {
                name: "clicked"
            }
        ]
    }
    Rectangle {
        id: addLocation
        visible: false
        x: 15
        y: 310
        width: 90
        height: 40
        opacity: 0.6
        color: "#424242"
        border.color: "black"
        border.width: 2
        radius: 6
    }
    Text {
        id: addTitle
        x: 20
        y: 315
        visible: false
        text: "Add Location"
        color: "white"
        font.bold: true
        font.pointSize: 7
        style: Text.Raised
        styleColor: "black"
    }
    Image {
        id: enter
        visible: false
        source: "images/player_play.png"
        x: 85
        y: 313
        width: 15
        height: 15

        MouseArea {
            //id: addLocation
            anchors.fill: parent
            onClicked: {
                //add.state = "";
                button2.visible = true;
                //addLocation.visible = false;
                //addTitle.visible = false;
                //enter.visible = false;
                //addCity.visible = false;

                city_label.text = city.text;
                button2.text = city.text;
                var doc = new XMLHttpRequest();
                doc.onreadystatechange = function() {
                    if (doc.readyState == XMLHttpRequest.DONE) {
                        var jsonObject = eval('(' + doc.responseText + ')');
                        loaded(jsonObject,1);
                     }
                 }
                 doc.open("GET", "http://free.worldweatheronline.com/feed/weather.ashx?q=" + button2.text + "&format=json&num_of_days=5&key=223ff2583d012617131202");
                 doc.send();

                var doc2 = new XMLHttpRequest();
                doc2.onreadystatechange = function() {
                    if (doc2.readyState == XMLHttpRequest.DONE) {
                        var jsonObject2 = eval('(' + doc2.responseText + ')');
                        showRequestTime(jsonObject2.data.time_zone[0].localtime);
                    }
                }
                doc2.open("GET", "http://free.worldweatheronline.com/feed/tz.ashx?q=" + button2.text + "&format=json&num_of_days=5&key=223ff2583d012617131202");
                doc2.send();
            }
        }
    }
    Rectangle {
        id: addCity
        visible: false
        x: 20
        y: 330
        width: 80
        height: 14
        opacity: 0.8
        color: "black"
        border.color: "black"
        border.width: 1
        TextInput {
            id: city
            //text: "Chicago"
            font.family: "Helvetica"
            font.pointSize: 8
            color: "white"
            focus: true
        }
    }

    // Button 1
    Button {
        x: 15
        y: 225
        id: button1
        text : "Chicago"

        onClicked: {

            city_label.text = button1.text;

               var doc = new XMLHttpRequest();
               doc.onreadystatechange = function() {
                  if (doc.readyState == XMLHttpRequest.DONE) {
                      var jsonObject = eval('(' + doc.responseText + ')');
                      loaded(jsonObject,1);
                   }
               }
               doc.open("GET", "http://free.worldweatheronline.com/feed/weather.ashx?q=" + button1.text + "&format=json&num_of_days=5&key=223ff2583d012617131202");
               doc.send();

            var doc2 = new XMLHttpRequest();
            doc2.onreadystatechange = function() {
               if (doc2.readyState == XMLHttpRequest.DONE) {
                   var jsonObject2 = eval('(' + doc2.responseText + ')');
                   showRequestTime(jsonObject2.data.time_zone[0].localtime);
                }
            }
            doc2.open("GET", "http://free.worldweatheronline.com/feed/tz.ashx?q=" + button1.text + "&format=json&num_of_days=5&key=223ff2583d012617131202");
            doc2.send();
        }
    }

    // Button 2
    Button {
        x: 15
        y: 265
        id: button2
        visible: false;
        //text : "New York"
        //text : city_label.text // city.text

        onClicked: {

            city_label.text = button2.text;

               var doc = new XMLHttpRequest();
               doc.onreadystatechange = function() {
                  if (doc.readyState == XMLHttpRequest.DONE) {
                      var jsonObject = eval('(' + doc.responseText + ')');
                      loaded(jsonObject,1);
                   }
               }
               doc.open("GET", "http://free.worldweatheronline.com/feed/weather.ashx?q=" + button2.text + "&format=json&num_of_days=5&key=223ff2583d012617131202");
               doc.send();

            var doc2 = new XMLHttpRequest();
            doc2.onreadystatechange = function() {
               if (doc2.readyState == XMLHttpRequest.DONE) {
                   var jsonObject2 = eval('(' + doc2.responseText + ')');
                   showRequestTime(jsonObject2.data.time_zone[0].localtime);
                }
            }
            doc2.open("GET", "http://free.worldweatheronline.com/feed/tz.ashx?q=" + button2.text + "&format=json&num_of_days=5&key=223ff2583d012617131202");
            doc2.send();
        }
    }

    /*******************************************************************************************/

    function loaded(jsonObject,temp)
    {
        //showRequestTime(jsonObject.data.current_condition[0].observation_time); // log0
        showRequestDate(jsonObject.data.weather[0].date); // log1
        //showRequestLocation(jsonObject.data.request[0].query); // currentLocation
        if (temp == 1) {
            showRequestTemp_F(jsonObject.data.current_condition[0].temp_F + " F"); // log2
            log3.visible = false;
            log2.visible = true;
        }
        if (temp == 0) {
            showRequestTemp_C(jsonObject.data.current_condition[0].temp_C + " C"); // log3
            log2.visible = false;
            log3.visible = true;
        }
        image1.source = jsonObject.data.current_condition[0].weatherIconUrl[0].value;
        showRequestDesc(jsonObject.data.current_condition[0].weatherDesc[0].value); // log4
        showRequestCloud(jsonObject.data.current_condition[0].cloudcover); // log5
        showRequestPrecipMM(jsonObject.data.current_condition[0].precipMM); // log6
        showRequestHumi(jsonObject.data.current_condition[0].humidity); // log7
        showRequestPres(jsonObject.data.current_condition[0].pressure); // log8
        showRequestVisi(jsonObject.data.current_condition[0].visibility); // log9
        showRequestWinspeed_Miles(jsonObject.data.current_condition[0].windspeedMiles); // log10
        //showRequestWinspeed_Kmph(jsonObject.data.current_condition[0].windspeedKmph); // log11
        showRequestWindir(jsonObject.data.current_condition[0].winddir16Point); // log12

        // Predict
        image2.source = jsonObject.data.weather[0].weatherIconUrl[0].value;
        image3.source = jsonObject.data.weather[1].weatherIconUrl[0].value;
        image4.source = jsonObject.data.weather[2].weatherIconUrl[0].value;
        image5.source = jsonObject.data.weather[3].weatherIconUrl[0].value;
        image6.source = jsonObject.data.weather[4].weatherIconUrl[0].value;
        showRequestDesc1(jsonObject.data.weather[0].weatherDesc[0].value);
        showRequestDesc2(jsonObject.data.weather[1].weatherDesc[0].value);
        showRequestDesc3(jsonObject.data.weather[2].weatherDesc[0].value);
        showRequestDesc4(jsonObject.data.weather[3].weatherDesc[0].value);
        showRequestDesc5(jsonObject.data.weather[4].weatherDesc[0].value);
        showRequestDate1(jsonObject.data.weather[0].date); // log13
        showRequestDate2(jsonObject.data.weather[1].date); // log14
        showRequestDate3(jsonObject.data.weather[2].date); // log15
        showRequestDate4(jsonObject.data.weather[3].date); // log16
        showRequestDate5(jsonObject.data.weather[4].date); // log17
        if (temp == 1) {
            showRequestTemp1(jsonObject.data.weather[0].tempMaxF+" F/"+jsonObject.data.weather[0].tempMinF+" F"); // log18
            showRequestTemp2(jsonObject.data.weather[1].tempMaxF+" F/"+jsonObject.data.weather[1].tempMinF+" F"); // log19
            showRequestTemp3(jsonObject.data.weather[2].tempMaxF+" F/"+jsonObject.data.weather[2].tempMinF+" F"); // log20
            showRequestTemp4(jsonObject.data.weather[3].tempMaxF+" F/"+jsonObject.data.weather[3].tempMinF+" F"); // log21
            showRequestTemp5(jsonObject.data.weather[4].tempMaxF+" F/"+jsonObject.data.weather[4].tempMinF+" F"); // log22
            log23.visible = false;
            log24.visible = false;
            log25.visible = false;
            log26.visible = false;
            log27.visible = false;
            log18.visible = true;
            log19.visible = true;
            log20.visible = true;
            log21.visible = true;
            log22.visible = true;
        }
        if (temp == 0) {
            showRequestTemp1C(jsonObject.data.weather[0].tempMaxC+" C/"+jsonObject.data.weather[0].tempMinC+" C"); // log23
            showRequestTemp2C(jsonObject.data.weather[1].tempMaxC+" C/"+jsonObject.data.weather[1].tempMinC+" C"); // log24
            showRequestTemp3C(jsonObject.data.weather[2].tempMaxC+" C/"+jsonObject.data.weather[2].tempMinC+" C"); // log25
            showRequestTemp4C(jsonObject.data.weather[3].tempMaxC+" C/"+jsonObject.data.weather[3].tempMinC+" C"); // log26
            showRequestTemp5C(jsonObject.data.weather[4].tempMaxC+" C/"+jsonObject.data.weather[4].tempMinC+" C"); // log27
            log18.visible = false;
            log19.visible = false;
            log20.visible = false;
            log21.visible = false;
            log22.visible = false;
            log23.visible = true;
            log24.visible = true;
            log25.visible = true;
            log26.visible = true;
            log27.visible = true;
        }
    }

    /****************************************************************************************************************/
    // Time
    Text {
        id: log0;
        visible: false;
        x: 190
        y: 25
        color: "#F2F2F2"
        font.bold: true
        font.pointSize: 20
        style: Text.Raised
        styleColor: "black"
    }
    function showRequestTime(text) {
        log0.text = text
        //console.log0(text)
    }

    // Date
    Text {
        id: log1;
        x: 310
        y: 90
        color: "#F2F2F2"
        font.bold: true
        font.pointSize: 15
        style: Text.Raised
        styleColor: "black"
    }
    function showRequestDate(text) {
        log1.text = text
        //console.log1(text)
    }

    // Temp_F
    Text {
        id: log2;
        x: 435
        y: 120
        color: "white"
        font.bold: true
        font.pointSize: 25
        style: Text.Raised
        styleColor: "black"
    }
    function showRequestTemp_F(text) {
        log2.text = text
        //console.log2(text)
    }

    // Temp_C
    Text {
        id: log3;
        x: 435
        y: 120
        color: "white"
        font.bold: true
        font.pointSize: 25
        style: Text.Raised
        styleColor: "black"
    }
    function showRequestTemp_C(text) {
        log3.text = text
        //console.log3(text)
    }

    // Desc
    Text {
        id: log4;
        x: 335
        y: 155
        color: "white"
        font.bold: true
        font.pointSize: 15
        style: Text.Raised
        styleColor: "black"
    }
    function showRequestDesc(text) {
        log4.text = text
        //console.log4(text)
        if (text == "Partly Cloudy") {
            image1.source = "images/Sunny-Period-64.png"
        }
        if (text == "Cloudy") {
            image1.source = "images/Cloudy-64.png"
        }
        if (text == "Overcast") {
            image1.source = "images/Overcast-64.png"
        }
        if (text == "Clear") {
            image1.source = "images/moon.png"
        }
        if (text == "Sunny") {
            image1.source = "images/Sunny-64.png"
        }
        if (text == "Mist") {
            image1.source = "images/fog-64.png"
        }
        if (text == "Heavy snow") {
            image1.source = "images/snow-64.png"
        }
        if (text == "Light snow") {
            image1.source = "images/light-snow-64.png"
        }
        if (text == "Heavy rain") {
            image1.source = "images/rain-64.png"
        }
        if (text == "Light rain") {
            image1.source = "images/light-rain-64.png"
        }
        if (text == "Light rain shower") {
            image1.source = "images/Light-Showers-64.png"
        }
    }
    Image {
        id: image1
        //source: "images/Overcast-64.png"
        x: 272
        y: 128
        width: 50
        height: 50
    }

    // Cloud
    Text {
        id: log5;
        x: 335
        y: 130
        color: "white"
        font.bold: true
        font.pointSize: 10
        style: Text.Raised
        styleColor: "black"
    }
    function showRequestCloud(text) {
        log5.text = "Cloud: " +text + "%"
        //console.log5(text)
    }

    // Location
    Text {
        x: 130
        y: 120
        text: city_label.text
        color: "white"
        font.bold: true
        font.pointSize: 20
        style: Text.Raised
        styleColor: "black"
    }
    Text {
        x: 130
        y: 160
        text: "United States"
        color: "white"
        font.bold: true
        font.pointSize: 10
        style: Text.Raised
        styleColor: "black"
    }

    Text {
            id: currentLocation;
            //visible: false
            x: 0
            y: 0
            color: "#F2F2F2"
            font.bold: true
            font.pointSize: 15
            style: Text.Raised
            styleColor: "black"
        }
        function showRequestLocation(text) {
            //currentLocation.text = qsTr(text.toString().substring(22,11))
           // currentLocation.text = "presión"
        }

    // precipMM
    Text {
        id: precipMM_EN
        x: 130
        y: 230
        text: "Precipitation"
        color: "white"
        font.bold: true
        font.pointSize: 10
        style: Text.Raised
        styleColor: "black"
    }
    Text {
        id: precipMM_SP
        visible: false
        x: 130
        y: 230
        text: "Precipitación"
        color: "white"
        font.bold: true
        font.pointSize: 10
        style: Text.Raised
        styleColor: "black"
    }
    Text {
        id: log6;
        x: 130
        y: 250
        color: "white"
        font.bold: true
        font.pointSize: 10
        style: Text.Raised
        styleColor: "black"
    }
    function showRequestPrecipMM(text) {
        log6.text = text + " inch"
        //console.log6(text)
    }

    // humidity
    Text {
        id: humidity_EN
        x: 225
        y: 230
        text: "Humidity"
        color: "white"
        font.bold: true
        font.pointSize: 10
        style: Text.Raised
        styleColor: "black"
    }
    Text {
        id: humidity_SP
        visible: false
        x: 225
        y: 230
        text: "Humedad"
        color: "white"
        font.bold: true
        font.pointSize: 10
        style: Text.Raised
        styleColor: "black"
    }
    Text {
        id: log7;
        x: 225
        y: 250
        color: "white"
        font.bold: true
        font.pointSize: 10
        style: Text.Raised
        styleColor: "black"
    }
    function showRequestHumi(text) {
        log7.text = text + "%"
        //console.log7(text)
    }

    // Pressure
    Text {
        id: pressure_EN
        x: 370
        y: 230
        text: "Pressure"
        color: "white"
        font.bold: true
        font.pointSize: 10
        style: Text.Raised
        styleColor: "black"
    }
    Text {
        id: pressure_SP
        visible: false
        x: 370
        y: 230
        text: "Presión"
        color: "white"
        font.bold: true
        font.pointSize: 10
        style: Text.Raised
        styleColor: "black"
    }
    Text {
        id: log8;
        x: 370
        y: 250
        color: "white"
        font.bold: true
        font.pointSize: 10
        style: Text.Raised
        styleColor: "black"
    }
    function showRequestPres(text) {
        log8.text = text + " hPa"
        //console.log8(text)
    }

    // Visibility
    Text {
        id: visibility_EN
        x: 445
        y: 230
        text: "Visibility"
        color: "white"
        font.bold: true
        font.pointSize: 10
        style: Text.Raised
        styleColor: "black"
    }
    Text {
        id: visibility_SP
        visible: false
        x: 445
        y: 230
        text: "Visibilidad"
        color: "white"
        font.bold: true
        font.pointSize: 10
        style: Text.Raised
        styleColor: "black"
    }
    Text {
        id: log9;
        x: 445
        y: 250
        color: "white"
        font.bold: true
        font.pointSize: 10
        style: Text.Raised
        styleColor: "black"
    }
    function showRequestVisi(text) {
        log9.text = text + " km"
        //console.log9(text)
    }

    // Wind
    Image {
        //id: image0
        source: "images/compass3.png"
        x: 290
        y: 190
        width: 70
        height: 70
    }
    Text {
        id: log10;
        x: 292
        y: 258
        color: "white"
        font.bold: true
        font.pointSize: 8
        style: Text.Raised
        styleColor: "black"
    }
    function showRequestWinspeed_Miles(text) {
        log10.text = text + " m/h"
        //console.log10(text)
    }
    Text {
        id: log11;
        x: 292
        y: 258
        color: "white"
        font.bold: true
        font.pointSize: 8
        style: Text.Raised
        styleColor: "black"
    }
    function showRequestWinspeed_Kmph(text) {
        log11.text = text + " km/h"
        //console.log11(text)
    }
    Text {
        id: log12;
        x: 338
        y: 258
        color: "white"
        font.bold: true
        font.pointSize: 8
        style: Text.Raised
        styleColor: "black"
    }
    function showRequestWindir(text) {
        log12.text = text
        //console.log12(text)
    }

    // predict
    Image {
        id: image2
        x: 140
        y: 305
        width: 35
        height: 35
    }
    Text {
            id: pred_1;
            x: 130
            y: 340
            color: "white"
            font.bold: true
            font.pointSize: 6
            style: Text.Raised
            styleColor: "black"
        }
    function showRequestDesc1(text) {
        pred_1.text = text

           if (text == "Partly Cloudy") {
               image2.source = "images/Sunny-Period-64.png"
           }
           if (text == "Cloudy") {
               image2.source = "images/Cloudy-64.png"
           }
           if (text == "Overcast") {
               image2.source = "images/Overcast-64.png"
           }
           if (text == "Sunny") {
               image2.source = "images/Sunny-64.png"
           }
           if (text == "Mist") {
               image2.source = "images/fog-64.png"
           }
           if (text == "Heavy snow") {
               image2.source = "images/snow-64.png"
           }
           if (text == "Light snow") {
               image2.source = "images/light-snow-64.png"
           }
           if (text == "Heavy rain") {
               image2.source = "images/rain-64.png"
           }
           if (text == "Light rain") {
               image2.source = "images/light-rain-64.png"
           }
           if (text == "Light rain shower") {
               image2.source = "images/Light-Showers-64.png"
           }
       }
    Text {
        id: log13;
        x: 130
        y: 355
        color: "white"
        font.bold: true
        font.pointSize: 7
        style: Text.Raised
        styleColor: "black"
    }
    function showRequestDate1(text) {
        log13.text = text
        //console.log13(text)
    }
    Text {
        id: log18;
        x: 135
        y: 368
        color: "white"
        font.bold: true
        font.pointSize: 7
        style: Text.Raised
        styleColor: "black"
    }
    function showRequestTemp1(text) {
        log18.text = text
        //console.log18(text)
    }
    Text {
        id: log23;
        x: 130
        y: 368
        color: "white"
        font.bold: true
        font.pointSize: 8
        style: Text.Raised
        styleColor: "black"
    }
    function showRequestTemp1C(text) {
        log23.text = text
        //console.log23(text)
    }

    Image {
        id: image3
        x: 220
        y: 305
        width: 35
        height: 35
    }
    Text {
            id: pred_2;
            x: 210
            y: 340
            color: "white"
            font.bold: true
            font.pointSize: 6
            style: Text.Raised
            styleColor: "black"
        }
    function showRequestDesc2(text) {
        pred_2.text = text
            if (text == "Partly Cloudy") {
                image3.source = "images/Sunny-Period-64.png"
            }
            if (text == "Cloudy") {
                image3.source = "images/Cloudy-64.png"
            }
            if (text == "Overcast") {
                image3.source = "images/Overcast-64.png"
            }
            if (text == "Sunny") {
                image3.source = "images/Sunny-64.png"
            }
            if (text == "Mist") {
                image3.source = "images/fog-64.png"
            }
            if (text == "Heavy snow") {
                image3.source = "images/snow-64.png"
            }
            if (text == "Light snow") {
                image3.source = "images/light-snow-64.png"
            }
            if (text == "Heavy rain") {
                image3.source = "images/rain-64.png"
            }
            if (text == "Rain") {
                image3.source = "images/rain-64.png"
            }
            if (text == "Light rain") {
                image3.source = "images/light-rain-64.png"
            }
            if (text == "Light rain shower") {
                image3.source = "images/Light-Showers-64.png"
            }
        }
    Text {
        id: log14;
        x: 210
        y: 355
        color: "white"
        font.bold: true
        font.pointSize: 7
        style: Text.Raised
        styleColor: "black"
    }
    function showRequestDate2(text) {
        log14.text = text
        //console.log14(text)
    }
    Text {
        id: log19;
        x: 215
        y: 368
        color: "white"
        font.bold: true
        font.pointSize: 7
        style: Text.Raised
        styleColor: "black"
    }
    function showRequestTemp2(text) {
        log19.text = text
        //console.log19(text)
    }
    Text {
        id: log24;
        x: 210
        y: 368
        color: "white"
        font.bold: true
        font.pointSize: 7
        style: Text.Raised
        styleColor: "black"
    }
    function showRequestTemp2C(text) {
        log24.text = text
        //console.log24(text)
    }

    Image {
        id: image4
        x: 300
        y: 305
        width: 35
        height: 35
    }
    Text {
        id: pred_3;
        x: 290
        y: 340
        color: "white"
        font.bold: true
        font.pointSize: 6
        style: Text.Raised
        styleColor: "black"
    }
    function showRequestDesc3(text) {
        pred_3.text = text
            if (text == "Partly Cloudy") {
                image4.source = "images/Sunny-Period-64.png"
            }
            if (text == "Cloudy") {
                image4.source = "images/Cloudy-64.png"
            }
            if (text == "Overcast") {
                image4.source = "images/Overcast-64.png"
            }
            if (text == "Sunny") {
                image4.source = "images/Sunny-64.png"
            }
            if (text == "Mist") {
                image4.source = "images/fog-64.png"
            }
            if (text == "Heavy snow") {
                image4.source = "images/snow-64.png"
            }
            if (text == "Light snow") {
                image4.source = "images/light-snow-64.png"
            }
            if (text == "Heavy rain") {
                image4.source = "images/rain-64.png"
            }
            if (text == "Light rain") {
                image4.source = "images/light-rain-64.png"
            }
            if (text == "Light rain shower") {
                image4.source = "images/Light-Showers-64.png"
            }
        }
    Text {
        id: log15;
        x: 290
        y: 355
        color: "white"
        font.bold: true
        font.pointSize: 7
        style: Text.Raised
        styleColor: "black"
    }
    function showRequestDate3(text) {
        log15.text = text
        //console.log15(text)
    }
    Text {
        id: log20;
        x: 290
        y: 368
        color: "white"
        font.bold: true
        font.pointSize: 7
        style: Text.Raised
        styleColor: "black"
    }
    function showRequestTemp3(text) {
        log20.text = text
        //console.log20(text)
    }
    Text {
        id: log25;
        x: 295
        y: 368
        color: "white"
        font.bold: true
        font.pointSize: 7
        style: Text.Raised
        styleColor: "black"
    }
    function showRequestTemp3C(text) {
        log25.text = text
        //console.log25(text)
    }

    Image {
        id: image5
        x: 380
        y: 305
        width: 40
        height: 40
    }
    Text {
                id: pred_4;
                x: 370
                y: 340
                color: "white"
                font.bold: true
                font.pointSize: 6
                style: Text.Raised
                styleColor: "black"
            }
    function showRequestDesc4(text) {
        pred_4.text = text
            if (text == "Partly Cloudy") {
                image5.source = "images/Sunny-Period-64.png"
            }
            if (text == "Cloudy") {
                image5.source = "images/Cloudy-64.png"
            }
            if (text == "Overcast") {
                image5.source = "images/Overcast-64.png"
            }
            if (text == "Sunny") {
                image5.source = "images/Sunny-64.png"
            }
            if (text == "Mist") {
                image5.source = "images/fog-64.png"
            }
            if (text == "Heavy snow") {
                image5.source = "images/snow-64.png"
            }
            if (text == "Light snow") {
                image5.source = "images/light-snow-64.png"
            }
            if (text == "Heavy rain") {
                image5.source = "images/rain-64.png"
            }
            if (text == "Light rain") {
                image5.source = "images/light-rain-64.png"
            }
            if (text == "Light rain shower") {
                image5.source = "images/Light-Showers-64.png"
            }
        }
    Text {
        id: log16;
        x: 370
        y: 355
        color: "white"
        font.bold: true
        font.pointSize: 7
        style: Text.Raised
        styleColor: "black"
    }
    function showRequestDate4(text) {
        log16.text = text
        //console.log16(text)
    }
    Text {
        id: log21;
        x: 370
        y: 368
        color: "white"
        font.bold: true
        font.pointSize: 7
        style: Text.Raised
        styleColor: "black"
    }
    function showRequestTemp4(text) {
        log21.text = text
        //console.log21(text)
    }
    Text {
        id: log26;
        x: 375
        y: 368
        color: "white"
        font.bold: true
        font.pointSize: 7
        style: Text.Raised
        styleColor: "black"
    }
    function showRequestTemp4C(text) {
        log26.text = text
        //console.log26(text)
    }

    Image {
        id: image6
        x: 460
        y: 305
        width: 35
        height: 35
    }
    Text {
                id: pred_5;
                x: 450
                y: 340
                color: "white"
                font.bold: true
                font.pointSize: 6
                style: Text.Raised
                styleColor: "black"
            }
    function showRequestDesc5(text) {
        pred_5.text = text
            if (text == "Partly Cloudy") {
                image6.source = "images/Sunny-Period-64.png"
            }
            if (text == "Cloudy") {
                image6.source = "images/Cloudy-64.png"
            }
            if (text == "Overcast") {
                image6.source = "images/Overcast-64.png"
            }
            if (text == "Sunny") {
                image6.source = "images/Sunny-64.png"
            }
            if (text == "Mist") {
                image6.source = "images/fog-64.png"
            }
            if (text == "Heavy snow") {
                image6.source = "images/snow-64.png"
            }
            if (text == "Light snow") {
                image6.source = "images/light-snow-64.png"
            }
            if (text == "Heavy rain") {
                image6.source = "images/rain-64.png"
            }
            if (text == "Light rain") {
                image6.source = "images/light-rain-64.png"
            }
            if (text == "Light rain shower") {
                image6.source = "images/Light-Showers-64.png"
            }
        }
    Text {
        id: log17;
        x: 450
        y: 355
        color: "white"
        font.bold: true
        font.pointSize: 7
        style: Text.Raised
        styleColor: "black"
    }
    function showRequestDate5(text) {
        log17.text = text
        //console.log17(text)
    }
    Text {
        id: log22;
        x: 455
        y: 368
        color: "white"
        font.bold: true
        font.pointSize: 7
        style: Text.Raised
        styleColor: "black"
    }
    function showRequestTemp5(text) {
        log22.text = text
        //console.log22(text)
    }
    Text {
        id: log27;
        x: 450
        y: 368
        color: "white"
        font.bold: true
        font.pointSize: 7
        style: Text.Raised
        styleColor: "black"
    }
    function showRequestTemp5C(text) {
        log27.text = text
        //console.log27(text)
    }

    Image {
        source: "images/24hourIcon.png"
        x: 400
        y:40
        width: 15
        height: 15
    }

    /********************* Alert ************************/
    // alert
        Image {
            id: alert
            source: "images/weather_severe_alert.png"
            x: 138
            y: 70
            width: 25
            height: 25

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (alert.state == 'clicked') {
                        alert.state = "";
                        alertRect.visible = false;
                        alertText0.visible = false;
                        alertText1.visible = false;
                        alertText2.visible = false;
                        alertText3.visible = false;
                        alertText4.visible = false;
                        alertText5.visible = false;
                        alertText6.visible = false;
                        alertText7.visible = false;
                        alertText8.visible = false;
                    }
                    else {
                        alert.state = 'clicked';
                        alertRect.visible = true;
                        alertText0.visible = true;
                        alertText1.visible = true;
                        alertText2.visible = true;
                        alertText3.visible = true;
                        alertText4.visible = true;
                        alertText5.visible = true;
                        alertText6.visible = true;
                        alertText7.visible = true;
                        alertText8.visible = true;
                    }
                }
            }
            states: [
                State {
                    name: "clicked"
                }
            ]
        }
    // Alert Text
    Rectangle {
            id: alertRect
            visible: false
            x: 15
            y: 100
            width: 220
            height: 110
            opacity: 0.8
            color: "black"
            border.color: "grey"
            border.width: 2
            radius: 10
    }
    Text {
            id: alertText0;
            visible: false;
            x: 22
            y: 105
            text: "Flood Alerts - Illinois"
            color: "white"
            font.bold: true
            font.pointSize: 7
            style: Text.Raised
            styleColor: "black"
    }
    Text {
            id: alertText1;
            visible: false;
            x: 22
            y: 116
            text: "River Flood Warning for: Cliton"
            color: "white"
            font.bold: true
            font.pointSize: 7
            style: Text.Raised
            styleColor: "black"
     }
    Text {
            id: alertText2;
            visible: false;
            x: 22
            y: 127
            text: "The Flood Warning continues for the KASKASKIA"
            color: "white"
            font.bold: true
            font.pointSize: 6
            style: Text.Raised
            styleColor: "black"
     }
    Text {
            id: alertText3;
            visible: false;
            x: 22
            y: 137
            text: "RIVER at CARLYLE LAKE"
            color: "white"
            font.bold: true
            font.pointSize: 6
            style: Text.Raised
            styleColor: "black"
     }
    Text {
            id: alertText4;
            visible: false;
            x: 22
            y: 148
            text: "*At 8:30AM Wendesday the stage was 424.1 feet."
            color: "white"
            font.bold: true
            font.pointSize: 6
            style: Text.Raised
            styleColor: "black"
     }
    Text {
            id: alertText5;
            visible: false;
            x: 22
            y: 159
            text: "*Flood Stage is 423.5 feet."
            color: "white"
            font.bold: true
            font.pointSize: 6
            style: Text.Raised
            styleColor: "black"
     }
    Text {
            id: alertText6;
            visible: false;
            x: 22
            y: 170
            text: "*Forecast... The river is forecast to remain near"
            color: "white"
            font.bold: true
            font.pointSize: 6
            style: Text.Raised
            styleColor: "black"
     }
    Text {
            id: alertText7;
            visible: false;
            x: 22
            y: 180
            text: "  424 feet through Thursday night."
            color: "white"
            font.bold: true
            font.pointSize: 6
            style: Text.Raised
            styleColor: "black"
     }
    Text {
            id: alertText8;
            visible: false;
            x: 22
            y: 191
            text: "*The river should fall below flood stage Saturday."
            color: "white"
            font.bold: true
            font.pointSize: 6
            style: Text.Raised
            styleColor: "black"
     }
    /*********************************************************************/

  Row {
        id:row1
        spacing: 2
        anchors.left: parent.left; anchors.bottom: parent.bottom; anchors.margins: 10

        TextInput {
            width: 240
            id: city_label
            //text: "Chicago"
            font.family: "Helvetica"
            font.pointSize: 12
            color: "white"
            focus: true
        }
    }

  // Timer
  Item {
      Timer {
          interval: 500; running: true; repeat: true
          //onTriggered: time.text = Date().toString()
          onTriggered: time.text =log0.text.toString().substring(22,11)
      }

      Text { id: time; visible: false; color: "white"}
      Text {
              id: log30;
              x: 210
              y: 20
              text: time.text
              color: "#F2F2F2"
              font.bold: true
              font.pointSize: 45
              style: Text.Raised
              styleColor: "black"
          }
  }

  Item {
        Timer {
            interval: 500; running: true; repeat: true
            onTriggered: date.text = Date().toString().substring(0,4)
        }

        Text {
            id: date;
            x: 400
            y: 60
            color: "#F2F2F2"
            font.bold: true
            font.pointSize: 15
            style: Text.Raised
            styleColor: "black"
        }
    }

}
