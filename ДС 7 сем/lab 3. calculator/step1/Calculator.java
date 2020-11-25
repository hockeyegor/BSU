import javax.swing.*;
import javax.swing.border.Border;
import javax.swing.border.CompoundBorder;
import javax.swing.border.EmptyBorder;
import javax.swing.border.LineBorder;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.math.BigDecimal;

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

    private JButton display;
    private JButton authorName;
    private JPanel panel;
    private BigDecimal result;
    private String preCommand;
    private boolean start;
    private BigDecimal MIN = BigDecimal.valueOf(-1000000000);
    private BigDecimal MAX = BigDecimal.valueOf(1000000000);

    public CalculatorPanel() {
        setLayout(new BorderLayout());

        result = BigDecimal.valueOf(0);
        preCommand = "=";
        start = true;

        authorName = new JButton("Камыш Егор, 4 курс, 4 группа, 2020");
        authorName.setEnabled(false);
        add(authorName, BorderLayout.SOUTH);
        display = new JButton("0");
        display.setEnabled(false);
        add(display, BorderLayout.NORTH);
        ActionListener insert = new InsertAction();
        ActionListener command = new CommandAction();
        panel = new JPanel();
        panel.setLayout(new GridLayout(5, 3));
        panel.setSize(1000, 600);
        addButton("Clear", command);
        addButton("-", command);
        addButton("+", command);
        addButton("7", insert);
        addButton("8", insert);
        addButton("9", insert);
        addButton("4", insert);
        addButton("5", insert);
        addButton("6", insert);
        addButton("1", insert);
        addButton("2", insert);
        addButton("3", insert);
        addButton("0", insert);
        addButton(".", insert);
        addButton("=", command);
        add(panel, BorderLayout.CENTER);
    }

    private void addButton(String label, ActionListener listener) {
        JButton button = new JButton(label);
        button.addActionListener(listener);
        panel.add(button);
        button.setForeground(Color.BLACK);
        button.setBackground(Color.WHITE);
        Border line = new LineBorder(Color.BLACK);
        Border margin = new EmptyBorder(5, 15, 5, 15);
        Border compound = new CompoundBorder(line, margin);
        button.setBorder(compound);
    }

    public void calculate(BigDecimal x) {

        if (preCommand.equals("+")) result = result.add(x).setScale(6);
        else if (preCommand.equals("-")) result = result.subtract(x).setScale(6);
        else if (preCommand.equals("=")) result = x;
        if (result.compareTo(MAX) != 1 && result.compareTo(MIN) != -1) {
            //DecimalFormat df = new DecimalFormat("#,###.000000");
            //display.setText("" + df.format(result.setScale(6)));
            display.setText("" + result.setScale(6));
        } else display.setText("Превышен лимит!");
    }

    private class InsertAction implements ActionListener {
        public void actionPerformed(ActionEvent event) {
            String input = event.getActionCommand();
            if (start) {
                display.setText("");
                start = false;
            }
            display.setText(display.getText() + input);
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
                calculate(new BigDecimal(display.getText()));
                preCommand = command;
                start = true;
            }
        }
    }
}