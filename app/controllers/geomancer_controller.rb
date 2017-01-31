class GeomancerController < ApplicationController
    layout "geomancer"
    before_action :set_questions

    def index
    end

    def question
    end

    def result
        @pattern = Pattern.find_by(pattern: parseRolls)
        @transcription = Transcription.find_by(question: @question, pattern: @pattern)
        @submission = Submission.new
    end

    def create
        @pattern = Pattern.find_by(pattern: parseRolls)
        @transcription = Transcription.find_by(question: @question, pattern: @pattern)
        @submission = Submission.new(submission_params)
        @submission.transcription = @transcription
        if @submission.save!
            redirect_to root_path
        else
            render :result
        end
    end

    def submission_params
      params.require(:submission).permit(:submission)
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_questions
        @questions = Question.all
        @question = Question.find_by(number: params[:question_id])
      end
      
      def parseRolls
        @rolls = params[:rolls]
        cols = rows = result = Array.new(4, 0)

        for i in 0..3 do
            (@rolls[i].to_i + @rolls[i + 4].to_i + @rolls[i + 8].to_i + @rolls[i + 12].to_i) % 2 == 0 ? cols[i] = 2 : cols[i] = 1   
            (@rolls[i * 4].to_i + @rolls[i * 4 + 1].to_i + @rolls[i * 4 + 2].to_i + @rolls[i * 4 + 3].to_i) % 2 == 0 ? rows[i] = 2 : rows[i] = 1
            (cols[i] + rows[i]) % 2 == 0 ? result[i] = 2 : result[i] = 1
        end
        cols.join("") + rows.join("") + result.join("")
      end


    # Never trust parameters from the scary internet, only allow the white list through.
    def submission_params
      params.require(:submission).permit(:submission)
    end




 # # GET /submissions/new
  # def new
    # @submission = Submission.new
  # end
#   
  # # POST /submissions
  # def create
    # @submission = Submission.new(submission_params)
# 
    # if @submission.save
      # redirect_to @submission, notice: 'Submission was successfully created.'
    # else
      # render :new
    # end
  # end
end
