import type { AxiosResponse } from 'axios';
import type { Merge } from 'type-fest';
import api from './index';
import type { User } from './users';

export interface FeedbackSession {
  id: number;
  provider: User;
  receiver: User;
  sessionDate?: string;
  createdAt: string;
  updatedAt: string;
}

export default {
  index(type: string) {
    const path = `/api/internal/feedback_sessions?type=${type}`;

    return api<unknown, Merge<AxiosResponse, { data: { feedbackSessions: FeedbackSession[] }}>>({
      method: 'get',
      url: path,
    });
  },
};
