<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Test.aspx.cs" Inherits="Test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">

        function checkForm() {

            var valid1 = checkAnswer1();
            var valid2 = checkAnswer2();
            var valid3 = checkAnswer3();
            var valid4 = checkAnswer4();
            var valid5 = checkAnswer5();
            var mone = 0;

            if (valid1 == true)
                mone++;
            if (valid2 == true)
                mone++;
            if (valid3 == true)
                mone++;
            if (valid4 == true)
                mone++;
            if (valid5 == true)
                mone++;

            document.getElementById("grade").innerHTML = mone;

            if (mone == 5) {
                document.getElementById("grader").style.backgroundColor = "#7A33A3";
                document.getElementById("grade").innerHTML = mone + " Well-Done!";
                return true;
            }
            return false;
        }


        function checkAnswer1() {

            var flag1 = false;
            var flag2 = false;
            var mone = 0;
            var element_array = document.getElementsByName("weightloss");

            for (i = 0; i < element_array.length; i++) {

                if (element_array[i].checked == true) {
                    mone++;
                }
                if ((element_array[i].checked == true) && (element_array[i].value == "eatfitsche")) {
                    flag1 = true;
                }
                if ((element_array[i].checked == true) && (element_array[i].value == "age")) {
                    flag2 = true;
                }
            }

            if ((flag1 == false) || (flag2 == false) || (mone != 2)) {
                document.getElementById("answer1_error").innerHTML = "Incorrect";
                return false;
            } else {
                document.getElementById("answer1_error").innerHTML = "";
                return true;
            }
        }


        function checkAnswer2() {

            var flag = false;
            var element_array = document.getElementsByName("cpr");
            for (i = 0; i < element_array.length; i++) {
                if ((element_array[i].checked == true) && (element_array[i].value == "230")) {
                    flag = true;
                    break;
                }
            }

            if (flag == false) {
                document.getElementById("answer2_error").innerHTML = "Incorrect";
                return false;
            } else {
                document.getElementById("answer2_error").innerHTML = "";
                return true;
            }
        }

        function checkAnswer3() {

            var element = document.getElementById("texture");


            if (element.value == "Texture") {
                document.getElementById("answer5_error").innerHTML = "";
                return true;
            } else {
                document.getElementById("answer5_error").innerHTML = "Incorrect";
                return false;
            }
        }


        function checkAnswer4() {

            var mone = 0;
            var element_array = document.getElementsByName("cityof2015");

            for (i = 0; i < element_array.length; i++) {
                // מעבר על מערך כפתורי הרדיו

                if (element_array[i].checked == true) {
                    mone++;
                }
            }

            if (mone != 1) {
                // לא סומנה התשובה בנכונה
                document.getElementById("answer6_error").innerHTML = "Incorrect";
                return false;
            } else {
                document.getElementById("answer6_error").innerHTML = "";
                return true;
            }
        }


        function checkAnswer5() {

            var element = document.getElementById("birdname");


            if (element.value == "Crane") {
                document.getElementById("answer7_error").innerHTML = "";
                return true;
            } else {
                document.getElementById("answer7_error").innerHTML = "Incorrect";
                return false;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <h2>
            Test!
        </h2>
        <form id="QuizForm" method="post" runat="server" action="Test.aspx" onclick="checkForm">
        <table id="quiz">
            <tr>
                <td>
                    What is the key to weight loss? <span id="answer1_error"></span>
                </td>
                <td>
                    <input class="QPut" type="checkbox" name="weightloss" value="breakfast" />
                    <span>Skipping breakfast.</span><br />
                    <input class="QPut" type="checkbox" name="weightloss" value="eatfitsche" />
                    <span>You must have a fun workout schedule.</span><br />
                    <!-- Correct answer -->
                    <input class="QPut" type="checkbox" name="weightloss" value="age" />
                    <span>Age is an important factor to weight loss.</span><br />
                    <!-- Correct answer -->
                    <input class="QPut" type="checkbox" name="weightloss" value="counting_calories" />
                    <span>Counting calories each every meal.</span>
                </td>
            </tr>
            <tr>
                <td>
                    In emergency cases where you need to provide CPR, how many breaths and heart pumps
                    do you give? <span id="answer2_error"></span>
                </td>
                <td>
                    <input class="QPut" type="radio" name="cpr" value="410" />
                    <span>4 breaths and 10 heart pumps.</span><br />
                    <input class="QPut" type="radio" name="cpr" value="230" />
                    <span>2 breaths and 30 heart pumps.</span><br />
                    <!--Correct answer-->
                    <input class="QPut" type="radio" name="cpr" value="250" />
                    <span>2 breaths and 50 heart pumps.</span><br />
                    <input class="QPut" type="radio" name="cpr" value="320" />
                    <span>3 breaths and 20 heart pumps.</span>
                </td>
            </tr>
            <tr>
                <td>
                    Reflected light, cast shadows and surface interest are best described as...? <span
                        id="answer5_error"></span>
                </td>
                <td>
                    <input class="QPut" type="text" id="texture" name="texture" maxlength="7" size="15" />
                </td>
                <!--Texture -->
            </tr>
            <tr>
                <td>
                    What is the top visited city of 2015? <span id="answer6_error"></span>
                </td>
                <td>
                    <input class="QPut" type="checkbox" name="cityof2015" value="london" />
                    <span>London,UK</span><br />
                    <!--Correct answer.-->
                    <input class="QPut" type="checkbox" name="cityof2015" value="bangkok" />
                    <span>Bangkok,Thailand</span><br />
                    <input class="QPut" type="checkbox" name="cityof2015" value="paris" />
                    <span>Paris,France</span><br />
                    <input class="QPut" type="checkbox" name="cityof2015" value="dubai" />
                    <span>Dubai,UAE</span>
                </td>
            </tr>
            <tr>
                <td>
                    What was Japan's sacred bird? <span id="answer7_error"></span>
                </td>
                <td>
                    <!--Crane -->
                    <input class="QPut" type="text" id="birdname" name="birdname" maxlength="5" size="20" />
                </td>
            </tr>
            <tr>
                <td style="text-align: center;">
                    <input class="QButton" type="button" value="Send" onclick="return checkForm()" />
                    <input class="QButton" type="reset" value="Reset" />
                </td>
                <td id="grader">
                    Grade: <span id="grade">0</span>
                </td>
            </tr>
        </table>
        </form>
    </center>
</asp:Content>
