# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_05_02_131116) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "alunos", force: :cascade do |t|
    t.string "nome"
    t.date "data_nascimento"
    t.string "email"
    t.string "telefone"
    t.bigint "responsaveis_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["responsaveis_id"], name: "index_alunos_on_responsaveis_id"
  end

  create_table "aulas", force: :cascade do |t|
    t.bigint "turma_id", null: false
    t.date "data"
    t.time "horario_inicio"
    t.time "horario_fim"
    t.text "conteudo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["turma_id"], name: "index_aulas_on_turma_id"
  end

  create_table "matriculas", force: :cascade do |t|
    t.bigint "aluno_id", null: false
    t.bigint "turma_id", null: false
    t.date "data_matricula"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "em_espera"
    t.index ["aluno_id"], name: "index_matriculas_on_aluno_id"
    t.index ["turma_id"], name: "index_matriculas_on_turma_id"
  end

  create_table "professors", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "telefone"
    t.string "especialidade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "responsaveis", force: :cascade do |t|
    t.string "nome"
    t.string "telefone"
    t.string "endereco"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "turmas", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.string "modalidade"
    t.string "local"
    t.string "horario"
    t.integer "capacidade"
    t.bigint "professor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["professor_id"], name: "index_turmas_on_professor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "alunos", "responsaveis", column: "responsaveis_id"
  add_foreign_key "aulas", "turmas"
  add_foreign_key "matriculas", "alunos"
  add_foreign_key "matriculas", "turmas"
  add_foreign_key "turmas", "professors"
end
