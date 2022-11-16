import type { User } from './users';

export interface FeedbackSession {
  id: number;
  provider: User;
  receiver: User;
  sessionDate?: string;
  createdAt: string;
  updatedAt: string;
}
