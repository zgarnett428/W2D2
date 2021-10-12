require "employee"

class Startup

    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = {}
        @employees = []

        salaries.each { |title, salary| @salaries[title] = salary }
    end

    def valid_title?(title)
        @salaries.include?(title)
    end

    def >(other_startup)
         @funding > other_startup.funding
    end

    def hire(candidate, title)
        if valid_title?(title)
            @employees << Employee.new(candidate, title)
        else
            error
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        amt = @salaries[employee.title]
        if @funding > amt
            @funding -= amt
            employee.pay(amt)
        else
            error
        end
    end

    def payday
        @employees.each { |employee| pay_employee(employee) }
    end

    def average_salary
        sum = 0
        @employees.each { |employee| sum += @salaries[employee.title] }
        sum / @employees.length
    end

    def close
        @employees.clear
        @funding = 0
    end

    def acquire(other_startup)
        @funding += other_startup.funding
        other_startup.salaries.each { |title, salary| @salaries[title] = salary if !@salaries.include?(title) }
        other_startup.employees.each { |employee| @employees << employee }
        other_startup.close
    end

end
