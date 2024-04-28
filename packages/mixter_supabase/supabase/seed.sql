-- LLM Providers

insert into "public"."llm_provider" (id, name, description, url, web, type)
values
('75ec7b74-75f2-4e83-82d8-fd9f66a7e12d', 'Groq', 'The fastest LLM inferencing available for real-time AI applications.', 'https://api.groq.com/openai/v1', 'https://console.groq.com', 'groq'),
('2fae3594-4ba6-4557-a495-340b78d50c30', 'OpenAI', 'The creators of the GPT-3.5 and GPT-4 models.', 'https://api.openai.com/v1', 'https://platform.openai.com', 'openai'),
('96172315-ee95-4e9f-97c7-9293857e1d84', 'Ollama', 'Run Llama 3, Phi 3, Mistral, Gemma, and other models. Customize and create your own.', 'http://127.0.0.1:11434/v1', 'https://ollama.com', 'ollama');

-- Groq Models
insert into "public"."llm_model" (model_id, name, description, context, llm_provider_id)
values
('llama3-8b-8192', 'LlaMA3 8B', 'Developer Meta', 8192, '75ec7b74-75f2-4e83-82d8-fd9f66a7e12d'),
('llama3-70b-8192', 'Llama3 70B', 'Developer Meta', 8192, '75ec7b74-75f2-4e83-82d8-fd9f66a7e12d'),
('mixtral-8x7b-32768', 'Mixtral 8x7b', 'Developer Mistral', 32768, '75ec7b74-75f2-4e83-82d8-fd9f66a7e12d'),
('gemma-7b-it', 'Gemma 7B', 'Developer Google', 8192, '75ec7b74-75f2-4e83-82d8-fd9f66a7e12d');

-- OpenAI Models
insert into "public"."llm_model" (model_id, name, description, context, llm_provider_id)
values
('gpt-4-turbo', 'GPT-4 Turbo with Vision', 'The latest GPT-4 Turbo model with vision capabilities. Vision requests can now use JSON mode and function calling.', 12800, '2fae3594-4ba6-4557-a495-340b78d50c30'),
('gpt-3.5-turbo-0125', 'GPT 3.5 Turbo', 'The latest GPT-3.5 Turbo model with higher accuracy at responding in requested formats and a fix for a bug which caused a text encoding issue for non-English language function calls.', 16385, '2fae3594-4ba6-4557-a495-340b78d50c30');

-- Ollama Models
insert into "public"."llm_model" (model_id, name, description, context, llm_provider_id)
values
('phi3', 'Phi-3 Mini', 'Phi-3 Mini is a 3.8B parameters, lightweight, state-of-the-art open model by Microsoft.', 128000, '96172315-ee95-4e9f-97c7-9293857e1d84'),
('llama3:8b', 'Llama3 8B', 'Developer Meta', 8192, '96172315-ee95-4e9f-97c7-9293857e1d84');