// Hedin A. García Hernández
// INEL4206-030
// Seven Segment Display Assignment 

// Pins for digits of the display
#define DIG1_PIN GPIO_NUM_4
#define DIG2_PIN GPIO_NUM_5
#define DIG3_PIN GPIO_NUM_16
#define DIG4_PIN GPIO_NUM_19

// Pins for segments of the display
#define SEG_A_PIN GPIO_NUM_14
#define SEG_B_PIN GPIO_NUM_13
#define SEG_C_PIN GPIO_NUM_25
#define SEG_D_PIN GPIO_NUM_26
#define SEG_E_PIN GPIO_NUM_27
#define SEG_F_PIN GPIO_NUM_12
#define SEG_G_PIN GPIO_NUM_33

void setup() {
  Serial.begin(115200);
  pinMode(DIG1_PIN, OUTPUT);
  pinMode(DIG2_PIN, OUTPUT);
  pinMode(DIG3_PIN, OUTPUT);
  pinMode(DIG4_PIN, OUTPUT);

  pinMode(SEG_A_PIN, OUTPUT);
  pinMode(SEG_B_PIN, OUTPUT);
  pinMode(SEG_C_PIN, OUTPUT);
  pinMode(SEG_D_PIN, OUTPUT);
  pinMode(SEG_E_PIN, OUTPUT);
  pinMode(SEG_F_PIN, OUTPUT);
  pinMode(SEG_G_PIN, OUTPUT);
}

void loop(){
  // Display a number in the seven segment display

  // First Digit
  digitalWrite(SEG_A_PIN, LOW);
  digitalWrite(SEG_B_PIN, LOW);
  digitalWrite(SEG_C_PIN, LOW);
  digitalWrite(SEG_D_PIN, LOW);
  digitalWrite(SEG_E_PIN, HIGH);
  digitalWrite(SEG_F_PIN, HIGH);
  digitalWrite(SEG_G_PIN, LOW);

  digitalWrite(DIG1_PIN, HIGH);
  digitalWrite(DIG2_PIN, LOW);
  digitalWrite(DIG3_PIN, LOW);
  digitalWrite(DIG4_PIN, LOW);

  delay(20);
  digitalWrite(DIG1_PIN, LOW);

  //Second Digit
  digitalWrite(SEG_A_PIN, LOW);
  digitalWrite(SEG_B_PIN, LOW);
  digitalWrite(SEG_C_PIN, LOW);
  digitalWrite(SEG_D_PIN, HIGH);
  digitalWrite(SEG_E_PIN, HIGH);
  digitalWrite(SEG_F_PIN, HIGH);
  digitalWrite(SEG_G_PIN, HIGH);

  digitalWrite(DIG1_PIN, LOW);
  digitalWrite(DIG2_PIN, HIGH);
  digitalWrite(DIG3_PIN, LOW);
  digitalWrite(DIG4_PIN, LOW);

  delay(20);
  digitalWrite(DIG2_PIN, LOW);

  //Third Digit
  digitalWrite(SEG_A_PIN, HIGH);
  digitalWrite(SEG_B_PIN, LOW);
  digitalWrite(SEG_C_PIN, LOW);
  digitalWrite(SEG_D_PIN, HIGH);
  digitalWrite(SEG_E_PIN, HIGH);
  digitalWrite(SEG_F_PIN, LOW);
  digitalWrite(SEG_G_PIN, LOW);

  digitalWrite(DIG1_PIN, LOW);
  digitalWrite(DIG2_PIN, LOW);
  digitalWrite(DIG3_PIN, HIGH);
  digitalWrite(DIG4_PIN, LOW);
  
  delay(20);
  digitalWrite(DIG3_PIN, LOW);

  //Fourth Digit
  digitalWrite(SEG_A_PIN, LOW);
  digitalWrite(SEG_B_PIN, LOW);
  digitalWrite(SEG_C_PIN, LOW);
  digitalWrite(SEG_D_PIN, LOW);
  digitalWrite(SEG_E_PIN, HIGH);
  digitalWrite(SEG_F_PIN, LOW);
  digitalWrite(SEG_G_PIN, LOW);

  digitalWrite(DIG1_PIN, LOW);
  digitalWrite(DIG2_PIN, LOW);
  digitalWrite(DIG3_PIN, LOW);
  digitalWrite(DIG4_PIN, HIGH);
  
  delay(20);
  digitalWrite(DIG4_PIN, LOW);

  delay(20);
}