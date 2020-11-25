import javax.swing.*;
import javax.swing.border.Border;
import javax.swing.border.CompoundBorder;
import javax.swing.border.EmptyBorder;
import javax.swing.border.LineBorder;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Map;

public class Calculator {
    public static void main(String[] args) {
        EventQueue.invokeLater(new Runnable() {
            public void run() {
                CalculatorFrame frame = new CalculatorFrame();
                frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
                frame.setVisible(true);
                JPanel panel = new JPanel();
                panel.setSize(1000, 600);
            }
        });
    }
}

class CalculatorFrame extends JFrame {
    public CalculatorFrame() {
        setTitle("Calculator");
        CalculatorPanel panel = new CalculatorPanel();
        add(panel);
        pack();
    }
}

class CalculatorPanel extends JPanel {
    private final Map <Character, JButton> buttons = new HashMap <>();
    private JButton display;
    private JButton authorName;
    private JPanel panel;
    private BigDecimal result;
    private String preCommand;
    private boolean start;
    private BigDecimal MIN = new BigDecimal("-1000000000000");
    private BigDecimal MAX = new BigDecimal("1000000000000");


    public CalculatorPanel() {
        setLayout(new BorderLayout());
        result = BigDecimal.valueOf(0).setScale(6);
        preCommand = "=";
        start = true;
        //  textField = new JTextField("0");
        authorName = new JButton("Камыш Егор, 4 курс, 4 группа, 2020");
        authorName.setEnabled(false);
        add(authorName, BorderLayout.SOUTH);
        display = new JButton("0");
        display.setEnabled(false);
        add(display, BorderLayout.NORTH);
        ActionListener insert = new InsertAction();
        ActionListener command = new CommandAction();
        addKeyListener(new KeyboardAction());
        setFocusable(true);
        requestFocusInWindow();
        panel = new JPanel();
        panel.setLayout(new GridLayout(4, 2));
        panel.setSize(1000, 600);
        //
        // addButton("Clear", command);
        addButton("+", command);
        addButton("-", command);
        addButton("*", command);
        addButton("/", command);
        addButton(".", insert);
        addButton("_", insert);
        addButton("1", insert);
        addButton("2", insert);
        addButton("3", insert);
        addButton("4", insert);
        addButton("5", insert);
        addButton("6", insert);
        addButton("7", insert);
        addButton("8", insert);
        addButton("9", insert);
        addButton("0", insert);
        addButton("=", command);
        add(panel, BorderLayout.CENTER);
    }

    private void addButton(String label, ActionListener listener) {
        JButton button = new JButton(label);
        button.addActionListener(listener);
        button.addKeyListener(new KeyboardAction());
        panel.add(button);
        button.setForeground(Color.BLACK);
        button.setBackground(Color.WHITE);
        Border line = new LineBorder(Color.BLACK);
        Border margin = new EmptyBorder(5, 15, 5, 15);
        Border compound = new CompoundBorder(line, margin);
        button.setBorder(compound);
        buttons.put(label.charAt(0), button);
    }

    public void calculate(BigDecimal x) {
        boolean mark = false;
        if (preCommand.equals("+")) result = result.add(x).setScale(6);
        else if (preCommand.equals("-")) result = result.subtract(x).setScale(6);
        else if (preCommand.equals("*")) result = result.multiply(x).setScale(6);
        else if (preCommand.equals("/")) {
            if (x.compareTo(BigDecimal.ZERO) != 0) result = result.divide(x, 6, BigDecimal.ROUND_HALF_UP);
            else mark = true;
        } else if (preCommand.equals("=") && !mark) result = x.setScale(6);
        if (mark) {
            display.setText("Деление на 0 запрещено!");
        }
        if (result.compareTo(MAX) != 1 && result.compareTo(MIN) != -1) {
            DecimalFormat myFormatter = new DecimalFormat("#,###.######");
            String s = String.valueOf(myFormatter.format(result.setScale(6).stripTrailingZeros())).replaceAll(",", ".");
            display.setText(s);
        } else display.setText("Превышен лимит!");
        if (mark) {
            display.setText("Деление на 0 запрещено!");
        }
    }

    private class InsertAction implements ActionListener {
        public void actionPerformed(ActionEvent event) {
            String input = event.getActionCommand();
            if (start) {
                display.setText("");
                start = false;
            }
            if (display.getText().contains(".") && input == ".") {
                return;
            }
            if (display.getText().contains(".")) {
                String[] split = display.getText().split("\\.");
                if (split.length == 2 && split[1].length() > 5) {
                    return;
                }
            }
            if (input == "_") {
                String text = display.getText() + " ";
                display.setText(text);
                return;
            }
            String text = display.getText() + input;
            display.setText(text);
        }
    }

    private class CommandAction implements ActionListener {
        public void actionPerformed(ActionEvent event) {
            String command = event.getActionCommand();
            if (start && result != BigDecimal.valueOf(0)) {
                if (command.equals("-")) {
                    display.setText(command);
                    start = false;
                } else preCommand = command;
            } else {
                calculate(new BigDecimal(display.getText().replaceAll("\\s+", "")));
                preCommand = command;
                start = true;
            }
        }
    }

    private class KeyboardAction extends KeyAdapter {

        @Override
        public void keyTyped(KeyEvent e) {
            Character keyChar = e.getKeyChar();
            JButton button = buttons.get(keyChar);
            if (button != null) {
                button.doClick();
            }
            if (e.getKeyChar() == '\n') {
                buttons.get('=').doClick();
            }
            if (e.getKeyChar() == KeyEvent.VK_SPACE) {
                buttons.get('_').doClick();
            }
            if(e.getKeyChar() == KeyEvent.VK_COMMA){
                buttons.get('.').doClick();
            }
        }
    }

    public class buhCalc{
        BigDecimal x1 = BigDecimal.valueOf(0);
        BigDecimal x2 = BigDecimal.valueOf(0);
        BigDecimal x3 = BigDecimal.valueOf(0);
        BigDecimal x4 = BigDecimal.valueOf(0);
        char operation1 = '+';
        char operation2 = '+';
        char operation3 = '+';
        BigDecimal buhRes;
        public BigDecimal calculate(BigDecimal x1, BigDecimal x2, BigDecimal x3, BigDecimal x4, char operation1,char operation2,char operation3){
            if (operation2 == '+') buhRes=x2.add(x3);
            if (operation2 == '-') buhRes=x2.subtract(x3);
            if (operation2 == '/') buhRes=x2.divide(x3);
            if (operation2 == '*') buhRes=x2.multiply(x3);

            if (operation1 == '+') buhRes=x1.add(buhRes);
            if (operation1 == '-') buhRes=x1.subtract(buhRes);
            if (operation1 == '/') buhRes=x1.divide(buhRes);
            if (operation1 == '*') buhRes=x1.multiply(buhRes);

            if (operation3 == '+') buhRes=buhRes.add(x4);
            if (operation3 == '-') buhRes=buhRes.subtract(x4);
            if (operation3 == '/') buhRes=buhRes.divide(x4);
            if (operation3 == '*') buhRes=buhRes.multiply(x4);

            return buhRes;

        }
    }
}