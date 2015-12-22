# coding: utf-8
require 'spec_helper'

describe Refactor do
  
  context "Refactor::Todo" do
    context ".deprecate" do 

      it "can mark blocks desired for deprecation" do 
        Refactor::Todo.deprecate do 
          puts "This block should be deprecated!"
        end
      end

      it "can make deprecated code raise exceptions instead of running the code" do 
        expect do
          Refactor::Todo.deprecate( strategy: :raise_exception) do 
            puts "This code shouldn't even run if strategy :exception is used"
            sleep(50) 
            puts "This code shouldn't even run if strategy :exception is used"
          end
        end.to raise_exception(Exception)
      end

      it "can make deprecated code short circuit and return nil" do 
        expect(
          Refactor::Todo.deprecate( strategy: :return_nil) do 
            puts "This code shouldn't even run if strategy :exception is used"
            sleep(50) 
            puts "This code shouldn't even run if strategy :exception is used"
          end
        ).to be_nil
      end

    end
  end

end