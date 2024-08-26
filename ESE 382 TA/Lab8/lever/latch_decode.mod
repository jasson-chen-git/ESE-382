MODEL
MODEL_VERSION "1.0";
DESIGN "latch_decode";
DATE "Tue Mar 26 14:53:43 2024";
VENDOR "Lattice Semiconductor Corporation";
PROGRAM "STAMP Model Generator";

/* port name and type */
INPUT a_0;
INPUT a_1;
INPUT a_2;
INPUT e1_bar;
INPUT e2;
INPUT le_bar;
OUTPUT y_0;
OUTPUT y_1;
OUTPUT y_2;
OUTPUT y_3;
OUTPUT y_4;
OUTPUT y_5;
OUTPUT y_6;
OUTPUT y_7;

/* timing arc definitions */
e1_bar_y_0_delay: DELAY e1_bar y_0;
e1_bar_y_1_delay: DELAY e1_bar y_1;
e1_bar_y_2_delay: DELAY e1_bar y_2;
e1_bar_y_3_delay: DELAY e1_bar y_3;
e1_bar_y_4_delay: DELAY e1_bar y_4;
e1_bar_y_5_delay: DELAY e1_bar y_5;
e1_bar_y_6_delay: DELAY e1_bar y_6;
e1_bar_y_7_delay: DELAY e1_bar y_7;
e2_y_0_delay: DELAY e2 y_0;
e2_y_1_delay: DELAY e2 y_1;
e2_y_2_delay: DELAY e2 y_2;
e2_y_3_delay: DELAY e2 y_3;
e2_y_4_delay: DELAY e2 y_4;
e2_y_5_delay: DELAY e2 y_5;
e2_y_6_delay: DELAY e2 y_6;
e2_y_7_delay: DELAY e2 y_7;
le_bar_y_0_delay: DELAY le_bar y_0;
le_bar_y_0_delay: DELAY le_bar y_0;
le_bar_y_0_delay: DELAY le_bar y_0;
le_bar_y_1_delay: DELAY le_bar y_1;
le_bar_y_1_delay: DELAY le_bar y_1;
le_bar_y_1_delay: DELAY le_bar y_1;
le_bar_y_2_delay: DELAY le_bar y_2;
le_bar_y_2_delay: DELAY le_bar y_2;
le_bar_y_2_delay: DELAY le_bar y_2;
le_bar_y_3_delay: DELAY le_bar y_3;
le_bar_y_3_delay: DELAY le_bar y_3;
le_bar_y_3_delay: DELAY le_bar y_3;
le_bar_y_4_delay: DELAY le_bar y_4;
le_bar_y_4_delay: DELAY le_bar y_4;
le_bar_y_4_delay: DELAY le_bar y_4;
le_bar_y_5_delay: DELAY le_bar y_5;
le_bar_y_5_delay: DELAY le_bar y_5;
le_bar_y_5_delay: DELAY le_bar y_5;
le_bar_y_6_delay: DELAY le_bar y_6;
le_bar_y_6_delay: DELAY le_bar y_6;
le_bar_y_6_delay: DELAY le_bar y_6;
le_bar_y_7_delay: DELAY le_bar y_7;
le_bar_y_7_delay: DELAY le_bar y_7;
le_bar_y_7_delay: DELAY le_bar y_7;

/* timing check arc definitions */
a_0_le_bar_setup: SETUP(POSEDGE) a_0 le_bar;
a_0_le_bar_hold: HOLD(POSEDGE) a_0 le_bar;
a_1_le_bar_setup: SETUP(POSEDGE) a_1 le_bar;
a_1_le_bar_hold: HOLD(POSEDGE) a_1 le_bar;
a_2_le_bar_setup: SETUP(POSEDGE) a_2 le_bar;
a_2_le_bar_hold: HOLD(POSEDGE) a_2 le_bar;

ENDMODEL
